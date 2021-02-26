//
//  MovieListView.swift
//  ProjectExam
//
//  Created by Sabbir on 26/2/21.
//


import SwiftUI

struct MovieListView: View {
    
    @ObservedObject private var nowPlayingState = MovieListDetails()
    @ObservedObject private var upcomingState = MovieListDetails()
    @ObservedObject private var topRatedState = MovieListDetails()
    @ObservedObject private var popularState = MovieListDetails()
    
    var body: some View {
        NavigationView {
            List {
                Group {
                    if nowPlayingState.movies != nil {
                        MovieListCardView(title: "Movie List", movies: nowPlayingState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.nowPlayingState.isLoading, error: self.nowPlayingState.error) {
                            self.nowPlayingState.loadMovies(with: .nowPlaying)
                        }
                    }
                    
                }
                .listRowInsets(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                
                Group {
                    if upcomingState.movies != nil {
                        MovieListHorizontalViewWithName(title: "", movies: upcomingState.movies!)
                    } else {
                        LoadingView(isLoading: self.upcomingState.isLoading, error: self.upcomingState.error) {
                            self.upcomingState.loadMovies(with: .upcoming)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
                
                Group {
                    if topRatedState.movies != nil {
                        MovieListHorizontalViewWithName(title: "", movies: topRatedState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.topRatedState.isLoading, error: self.topRatedState.error) {
                            self.topRatedState.loadMovies(with: .topRated)
                        }
                    }
                    
                    
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 8, trailing: 0))
                
                Group {
                    if popularState.movies != nil {
                        MovieListHorizontalViewWithName(title: "", movies: popularState.movies!)
                        
                    } else {
                        LoadingView(isLoading: self.popularState.isLoading, error: self.popularState.error) {
                            self.popularState.loadMovies(with: .popular)
                        }
                    }
                }
                .listRowInsets(EdgeInsets(top: 8, leading: 0, bottom: 16, trailing: 0))
                
                
                
            }
            .navigationBarTitle("TMDb")
            .navigationBarHidden(false)
        }
        .onAppear {
            self.nowPlayingState.loadMovies(with: .nowPlaying)
            self.upcomingState.loadMovies(with: .upcoming)
            self.topRatedState.loadMovies(with: .topRated)
            self.popularState.loadMovies(with: .popular)
        }
        
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}


