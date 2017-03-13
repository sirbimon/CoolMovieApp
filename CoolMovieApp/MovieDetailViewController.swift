//
//  MovieDetailViewController.swift
//  CoolMovieApp
//
//  Created by TJ Carney on 3/11/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    @IBOutlet weak var detailPoster: UIImageView!
    
    @IBOutlet weak var plotLabel: UILabel!
    
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var metaLabel: UILabel!
    
    var store = MovieDataStore.sharedInstance
    var movieTitle: String = ""
    var displayedMovie = Movie(title: "placeholder", posterURL: "placeholderURL")
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        print("VIEW LOADED")
            self.store.createMovieDetails(title: self.movieTitle) {
                print("DETAILS: \(self.store.currentMovieDetails)")
                guard let unwrappedDetails = self.store.currentMovieDetails else {return}
                self.releasedLabel.text = "RELEASED: \(unwrappedDetails.releaseDate)"
                self.directorLabel.text = "DIRECTOR: \(unwrappedDetails.director)"
                self.writerLabel.text = "WRITER: \(unwrappedDetails.writer)"
                self.starsLabel.text = "STARS: \(unwrappedDetails.stars)"
                self.imdbLabel.text = "IMDB Score: \(unwrappedDetails.imdbScore)"
                self.metaLabel.text = "MetaScore: \(unwrappedDetails.metaScore)"
                self.plotLabel.text = unwrappedDetails.plot
                
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
