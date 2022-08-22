//
//  MoviesClientType.swift
//  Movies
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Foundation
import NetworkProvider

enum MoviesClientType {
    case popular(_ page: Int)
    case topRated(_ page: Int)
}

extension MoviesClientType {
    var networkService: NetworkService {
        switch self {
        case let .popular(page): return PopularMoviesService(page: page)
        case let .topRated(page): return TopRatedMoviesService(page: page)
        }
    }
}
