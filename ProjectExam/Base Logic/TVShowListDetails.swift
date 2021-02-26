//
//  TVShowListDetails.swift
//  ProjectExam
//
//  Created by Sabbir on 26/2/21.
//
 
import SwiftUI

class TVShowListDetails: ObservableObject {
    
    @Published var movies: [MovieListModel]?
    @Published var isLoading: Bool = false
    @Published var error: NSError?

    private let movieService: GenericService
    
    init(movieService: GenericService = BaseNetworkCall.shared) {
        self.movieService = movieService
    }
    
    func loadMovies(with endpoint: MovieListEndpoint) {
        self.movies = nil
        self.isLoading = true
        self.movieService.fetchTVShowList(from: endpoint) { [weak self] (result) in
            guard let self = self else { return }
            self.isLoading = false
            switch result {
            case .success(let response):
                self.movies = response.results
                
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
    
}
