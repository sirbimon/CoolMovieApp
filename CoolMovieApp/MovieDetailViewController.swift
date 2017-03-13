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
    @IBOutlet weak var blurImage: UIImageView!
    
    @IBOutlet weak var plotLabel: UILabel!
    
    @IBOutlet weak var releasedLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var writerLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var imdbLabel: UILabel!
    @IBOutlet weak var metaLabel: UILabel!
    
    var store = MovieDataStore.sharedInstance
    var movieTitle: String = ""
    var movieURLString: String = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = self.movieTitle
            self.store.createMovieDetails(title: self.movieTitle) {
                DispatchQueue.main.async {
                    print("DETAILS: \(self.store.currentMovieDetails)")
                    guard let unwrappedDetails = self.store.currentMovieDetails else {return}
                    self.releasedLabel.text = "RELEASED: \(unwrappedDetails.releaseDate)"
                    self.directorLabel.text = "DIRECTOR: \(unwrappedDetails.director)"
                    self.writerLabel.text = "WRITER: \(unwrappedDetails.writer)"
                    self.starsLabel.text = "STARS: \(unwrappedDetails.stars)"
                    self.imdbLabel.text = "IMDB Score: \(unwrappedDetails.imdbScore)"
                    self.metaLabel.text = "MetaScore: \(unwrappedDetails.metaScore)"
                    self.plotLabel.text = unwrappedDetails.plot
                    let posterImage = self.store.imageCache.object(forKey: self.movieURLString as AnyObject)
                    self.detailPoster.image = posterImage as! UIImage?
                    self.blurImage.image = posterImage as! UIImage?
                    let darkBlur = UIBlurEffect(style: UIBlurEffectStyle.dark)
                    let blurView = UIVisualEffectView(effect: darkBlur)
                    blurView.frame = self.blurImage.bounds
                    self.blurImage.addSubview(blurView)
                    

                }
                
            }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "plotSegue" {
            let destVC = segue.destination as! PlotViewController
            destVC.movieTitle = self.movieTitle
        }
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "plotSegue", sender: self)
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
