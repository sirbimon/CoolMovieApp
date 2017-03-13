//
//  PlotViewController.swift
//  CoolMovieApp
//
//  Created by TJ Carney on 3/13/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class PlotViewController: UIViewController {
    
    @IBOutlet weak var plotLabel: UILabel!
    
    var store = MovieDataStore.sharedInstance
    var movieTitle: String = ""
    var plot: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "PLOT"
        store.createPlot(title: movieTitle) {
            DispatchQueue.main.async {
                guard let unwrappedPlot = self.store.currentPlot else {return}
                self.plotLabel.text = unwrappedPlot.plot
            }
            

        }

        // Do any additional setup after loading the view.
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
