//
//  MoviePlot.swift
//  CoolMovieApp
//
//  Created by TJ Carney on 3/13/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation

class MoviePlot{
    
    let plot: String
    
    init(dictionary: [String:String]) {
        self.plot = dictionary["Plot"] ?? "No Plot"
    }
}

extension MoviePlot: CustomStringConvertible {
    var description: String {
        return "Plot: \(plot)"
    }
}
