//
//  DetailsMovieViewModel.swift
//  Movies
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import Combine

final class DetailsMovieViewModel: ObservableObject {
    
    // MARK: - Properties
    
    @Published var movie: PopularMovie
    
    // MARK: - Lifecycle
    
    init(_ movie: PopularMovie) {
        self.movie = movie
        
        fetchImage()
    }
    
    // MARK: - Helpers
    
    private func fetchImage() {
        movie.fetchImage()
    }
}
