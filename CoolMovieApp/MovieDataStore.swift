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
    var currentPlot: MoviePlot?
    var imageCache = NSCache<AnyObject, AnyObject>()
    
    
    
    func createMovies(title: String, completion: @escaping ()->()) {
        
        OMDBAPIClient.getSearchResults(title: title) { (searchResults) in
            self.movies.removeAll()
            
            for result in searchResults {
                let title = result["Title"] as? String ?? "No Title"
                let poster = result["Poster"] as? String ?? "No Poster"
                let newMovie = Movie(title: title, posterURL: poster)
                self.movies.append(newMovie)
            }
            completion()
        }
    }
    
    func createMovieDetails(title: String, completion: @escaping () -> ()) {
        print("GOT CALLED!")
        OMDBAPIClient.getMovieDetails(movieTitle: title) { (detailsDict) in
            self.currentMovieDetails = MovieDetails(dictionary: detailsDict)
            print(self.currentMovieDetails?.title as Any)
            completion()
        }
        
        
    }
    
    func createPlot(title: String, completion: @escaping () -> ()) {
        OMDBAPIClient.getFullPlot(movieTitle: title) { (plotDict) in
            self.currentPlot = MoviePlot(dictionary: plotDict)
            print("TITLE: \(title)")
            print("PLOT: \(self.currentPlot)")
            completion()
        }
    }
    
    
    
}
