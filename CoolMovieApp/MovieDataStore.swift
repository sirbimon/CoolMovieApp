//
//  MovieDataStore.swift
//  CoolMovieApp
//
//  Created by Bimonaretga on 3/10/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation

class MovieDataStore {
    
    static let sharedInstance = MovieDataStore()
    private init () {}
    
    var movies = [Movie]()
    var currentMovieDetails: MovieDetails?
    
    
    func createMovies(title: String, completion: @escaping ()->()) {
        
        OMDBAPIClient.getSearchResults(title: title) { (searchResults) in
            self.movies.removeAll()
            
            for result in searchResults {
                let title = result["Title"] as? String ?? "No Title"
                let poster = result["Poster"] as? String ?? "No Poster"
                print(title)
                let newMovie = Movie(title: title, posterURL: poster)
                self.movies.append(newMovie)
            }
            completion()
        }
    }
    
    func createMovieDetails(title: String) {
        currentMovieDetails = nil
        OMDBAPIClient.getMovieDetails(movieTitle: title) { (detailsDict) in
            self.currentMovieDetails = MovieDetails(dictionary: detailsDict)
            print(self.currentMovieDetails?.title)
        }
        
    }
    
    
    
}
