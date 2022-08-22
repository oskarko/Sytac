//
//  DetailsMovieView.swift
//  Movies
//
//  Created by Oscar R. Garrucho.
//  Linkedin: https://www.linkedin.com/in/oscar-garrucho/
//  Copyright © 2022 Oscar R. Garrucho. All rights reserved.
//

import SwiftUI

struct DetailsMovieView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: DetailsMovieViewModel
    
    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .center, spacing: 15) {
            imageView
            textsView
        }
        .frame(minWidth: 0,
               maxWidth: .infinity,
               minHeight: 0,
               maxHeight: .infinity,
               alignment: .topLeading)
        .padding(.top, 32)
        .padding(.bottom, 5)
    }
    
    var imageView: some View {
        Image(uiImage: viewModel.movie.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 240)
            .clipped()
            .cornerRadius(10)
            .padding(.bottom)
    }
    
    var textsView: some View {
        VStack(alignment: .leading, spacing: 7) {
            Text("\(viewModel.movie.title)")
            Text("\(viewModel.movie.overview)")
                .font(.footnote)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal)
    }
}

// MARK: - Preview

struct DetailsMovieView_Previews: PreviewProvider {
    static let movie = PopularMovie(
        id: 791373,
        title: "Zack Snyder's Justice League",
        overview: "Determined to ensure Superman's ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions.",
        posterPath: "/tnAuB8q5vv7Ax9UAEje5Xi4BXik.jpg"
    )
    static let viewModel = DetailsMovieViewModel(movie)
    static var previews: some View {
        DetailsMovieView(viewModel: viewModel)
    }
}
