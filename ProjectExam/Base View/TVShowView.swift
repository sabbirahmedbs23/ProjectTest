//
//  TVShowView.swift
//  ProjectExam
//
//  Created by Sabbir on 26/2/21.
//

import SwiftUI

struct TVShowView: View {
    
    @ObservedObject private var tvShowList = TVShowListDetails()
 
    
    var body: some View {
        NavigationView {
            List {
                
                if tvShowList.movies != nil {
                    TVShowListView(title: "TV Show", movies: tvShowList.movies!)
                } else {
                    LoadingView(isLoading: self.tvShowList.isLoading, error: self.tvShowList.error) {
                        self.tvShowList.loadMovies(with: .upcoming)
                    }
                }

            }
            .navigationBarTitle("TMDb")
        }
        .onAppear {
            self.tvShowList.loadMovies(with: .nowPlaying)

        }
        
    }
}

struct TVShowView_Previews: PreviewProvider {
    static var previews: some View {
        TVShowView()
    }
}

