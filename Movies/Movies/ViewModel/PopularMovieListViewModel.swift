//
//  PopularMovieListViewModel.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Combine
import Common

class PopularMovieListViewModel: ListViewModelProtocol {
    // MARK: - Properties
    
    @Published private(set) var title = "movies_navbar_title".localized
    @Published private(set) var datasource: [PopularMovie] = []
    @Published var showError = false
    @Published var isLoadingPage = false
    
    private var currentPage = 1
    private var canLoadMorePages = true
    var errorMessage: String?
    private var repository: MoviesRepositoryProtocol
    
    // MARK: - Lifecycle
    
    init(repository: MoviesRepositoryProtocol = MoviesRepository()) {
        self.repository = repository
        
        loadMoreContent()
    }
    
    // MARK: - Helpers
    
    func loadMoreContentIfNeeded(currentMovie movie: PopularMovie?) {
        guard let movie = movie else {
            loadMoreContent()
            return
        }
        
        let thresholdIndex = datasource.index(datasource.endIndex, offsetBy: -5)
        if datasource.firstIndex(where: { $0.id == movie.id }) == thresholdIndex {
            loadMoreContent()
        }
    }
    
    private func loadMoreContent() {
        guard let moviesRepo = repository as? MoviesRepository,
              !isLoadingPage && canLoadMorePages else {
            return
        }
        
        isLoadingPage = true
        
        moviesRepo.fetchMovies(.popular(currentPage)) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let movieList):
                self.canLoadMorePages = movieList.totalPages > movieList.page
                self.isLoadingPage = false
                self.currentPage += 1
                self.handleSuccess(data: movieList)
            case .failure(let error):
                self.handleFailure(error: error)
            }
        }
    }
}

private extension PopularMovieListViewModel {
    func handleSuccess(data: MovieList) {
        datasource.append(contentsOf: MovieAdaptor.popular(data.results))
        title = "\("movie_popular_title".localized) (\(datasource.count))"
    }
    
    func handleFailure(error: Error) {
        errorMessage = "\(error)"
        showError = true
    }
}
