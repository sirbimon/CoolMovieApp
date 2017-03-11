//
//  MovieCollectionViewController.swift
//  CoolMovieApp
//
//  Created by Bimonaretga on 3/10/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

private let reuseIdentifier = "movieCell"

class MovieCollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UISearchBarDelegate {
    
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    
    let store = MovieDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.searchBar.delegate = self
        

        
        store.createMovieDetails(title: "Star Wars: Episode IV - A New Hope")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        collectionView.reloadData()
    }


    // MARK: UICollectionViewDataSource

     func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


     func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return store.movies.count
    }

     func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCell", for: indexPath) as! CollectionViewCell
        cell.movie = store.movies[indexPath.item]
        
        return cell
    }

    
    func turnStringIntoQuery(search: String) -> String {
        return search.replacingOccurrences(of: " ", with: "+", options: .literal)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        let validText = searchText.replacingOccurrences(of: " ", with: "+")
        store.createMovies(title: "\(validText)") {
            self.collectionView.reloadData()
        }
        
        view.endEditing(true)
        
    }
    
}



