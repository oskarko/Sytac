//
//  MovieListView.swift
//  Movies
//
//  Created by xdmgzdev on 13/04/2021.
//

import Combine
import Common
import SwiftUI

struct MovieListView: View {
    @ObservedObject var viewModel: PopularMovieListViewModel
    
    init(viewModel: PopularMovieListViewModel = PopularMovieListViewModel()) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.datasource) { movie in
                        NavigationLink(
                            destination: DetailsMovieView(
                                viewModel: .init(movie)
                            )
                        ) {
                            MovieRow(movie: movie)
                                .onAppear {
                                    viewModel.loadMoreContentIfNeeded(currentMovie: movie)
                                }
                        }
                    }
                    if viewModel.isLoadingPage {
                        ProgressView()
                    }
                }
            }
            .navigationTitle(viewModel.title)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .alert(isPresented: $viewModel.showError, content: {
            Alert(
                title: Text("alert_error_title".localized),
                message: Text(viewModel.errorMessage ?? "")
            )
        })
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
