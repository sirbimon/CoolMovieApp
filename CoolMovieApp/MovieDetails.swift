//
//  MovieDetails.swift
//  CoolMovieApp
//
//  Created by Bimonaretga on 3/10/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation
import UIKit

class MovieDetails {
    let title: String
    let plot: String
    let releaseDate: String
    let director: String
    let writer: String
    let stars: String
    let imdbScore: String
    let metaScore: String
    
    
    
    init(dictionary: [String:String]) {
        self.title = dictionary["Title"] ?? "No Title"
        self.plot = dictionary["Plot"] ?? "No Plot"
        self.releaseDate = dictionary["Year"] ?? "NEVER RELEASED"
        self.director = dictionary["Director"] ?? "SELF DIRECTED"
        self.writer = dictionary["Writer"] ?? "Poorly Written"
        self.stars = dictionary["Actors"] ?? "No Actors"
        self.imdbScore = dictionary["imdbRating"] ?? "NOT RATED"
        self.metaScore = dictionary["Metascore"] ?? "0"
    }
    
}

extension MovieDetails: CustomStringConvertible {
    var description: String {
        return "Title: \(title)"
    }
}
