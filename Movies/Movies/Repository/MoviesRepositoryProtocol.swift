//
//  MoviesRepositoryProtocol.swift
//  Movies
//
//  Created by xdmgzdev on 14/04/2021.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func fetchMovies(_ clientType: MoviesClientType,
                     completionHandler: @escaping (Result<MovieList, Swift.Error>) -> Void)
}
