//
//  MoviesRepository.swift
//  Movies
//
//  Created by xdmgzdev on 14/04/2021.
//

import Foundation
import NetworkProvider

class MoviesRepository: MoviesRepositoryProtocol {
    var client: NetworkProviderProtocol?
    
    func fetchMovies(_ clientType: MoviesClientType,
                     completionHandler: @escaping (Result<MovieList, Swift.Error>) -> Void) {
        
        client = MovieServiceClient(clientService: clientType.networkService)
        client?.request(dataType: MovieList.self, onQueue: .main) { result in
            switch result {
            case .success(let response):
                completionHandler(.success(response))
            case .failure(let error):
                completionHandler(.failure(error))
            }
        }
    }
}
