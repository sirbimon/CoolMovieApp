//
//  OMDBAPIClient.swift
//  CoolMovieApp
//
//  Created by Bimonaretga on 3/10/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import Foundation
import UIKit

class OMDBAPIClient {
    
    let store = MovieDataStore.sharedInstance
    
    class func getSearchResults(title: String, completion: @escaping ([[String:Any]]) -> Void ) {
        
    
        
        let urlString = "http://www.omdbapi.com/?s=\(title)"
        let url = URL(string: urlString)
        
        guard let unwrappedURL = url else { return }
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedData = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String: Any] ?? [:]
                let searchResults = json["Search"] as? [[String: Any]] ?? [[:]]
                completion(searchResults)
                
            } catch {
                
            }
        }
        
        dataTask.resume()
    }
    
    class func getMovieDetails(movieTitle: String, completion: @escaping ([String:String]) -> () ) {
        
        let validMovieTitle = movieTitle.replacingOccurrences(of: " ", with: "+")
        print(validMovieTitle)
        
        let urlString = "http://www.omdbapi.com/?t=\(validMovieTitle)"
        let url = URL(string: urlString)
        
        guard let unwrappedURL = url else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedData = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:String] ?? [:]
                completion(json)
                
            } catch {
                
            }
        }
        dataTask.resume()
    }
    
    class func getFullPlot(movieTitle: String, completion: @escaping ([String:String]) -> () ) {
        
        let validMovieTitle = movieTitle.replacingOccurrences(of: " ", with: "+")
        print("VALID TITLE: \(validMovieTitle)")
        
        let urlString = "http://www.omdbapi.com/?t=\(validMovieTitle)&plot=full"
        let url = URL(string: urlString)
        
        guard let unwrappedURL = url else { return }
        let session = URLSession.shared
        let dataTask = session.dataTask(with: unwrappedURL) { (data, response, error) in
            
            guard let unwrappedData = data else { return }
            do {
                let json = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? [String:String] ?? [:]
                print("JSON: \(json)")
                completion(json)
                
            } catch {
                
            }
        }
        dataTask.resume()
    }

    
    
    
    
}
