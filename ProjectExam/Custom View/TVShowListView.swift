//
//  TVShowListView.swift
//  ProjectExam
//
//  Created by Sabbir on 26/2/21.
//

import SwiftUI

struct TVShowListView: View {
    
    let title: String
    let movies: [MovieListModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movieId: movie.id)) {
                            MoviePosterCard(movie: movie)
                        }.buttonStyle(PlainButtonStyle())
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                    }
                }
            }
        }
        
    }
}

struct TVShowListView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowListView(title: "TV Show", movies: MovieListModel.stubbedMovies)
    }
}

