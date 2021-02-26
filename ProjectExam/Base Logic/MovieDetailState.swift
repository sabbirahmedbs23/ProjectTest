//
//  MovieDetailState.swift
//  ProjectExam
//
//  Created by Sabbir on 26/2/21.
//


import SwiftUI

class MovieDetailState: ObservableObject {
    
    private let movieService: GenericService
    @Published var movie: MovieListModel?
    @Published var isLoading = false
    @Published var error: NSError?
    
    init(movieService: GenericService = BaseNetworkCall.shared) {
        self.movieService = movieService
    }
    
    func loadMovie(id: Int) {
        self.movie = nil
        self.isLoading = false
        self.movieService.loadMovieDetails(id: id) {[weak self] (result) in
            guard let self = self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}

