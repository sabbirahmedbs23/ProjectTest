//
//  ContentView.swift
//  ProjectExam
//
//  Created by Sabbir on 26/2/21.
//


import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Movies")
                    }
            }
            .tag(0)
            
            TVShowView()
                .tabItem {
                    VStack {
                        Image(systemName: "radio")
                        Text("TV Show")
                    }
            }
            .tag(1)
            
            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
            }
            .tag(2)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
