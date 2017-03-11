//
//  Movie.swift
//  CoolMovieApp
//
//  Created by Bimonaretga on 3/10/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation
import UIKit

class Movie {
    
    let title: String
    let posterURL: String
    var posterImg: UIImage = #imageLiteral(resourceName: "poster")
    
    
    init(title: String, posterURL: String) {
        self.title = title
        self.posterURL = posterURL
    }
    
    
}
