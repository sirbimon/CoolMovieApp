//
//  CollectionViewCell.swift
//  CoolMovieApp
//
//  Created by Bimonaretga on 3/10/17.
//  Copyright © 2017 moeCodes. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var store = MovieDataStore.sharedInstance
    
    var movie: Movie? {
        didSet {
            
            guard let urlString = self.movie?.posterURL else { return }
            posterImg.image = nil
            
            if let imageFromCache = store.imageCache.object(forKey: urlString as AnyObject) {
                movie?.posterImg = (imageFromCache as! UIImage)
                posterImg.image = (imageFromCache as! UIImage)
                print()
                return
            }
            
            guard let url = URL(string: urlString) else { return }
            guard let data = NSData(contentsOf: url) else { return }
            guard let image = UIImage(data: data as Data) else { return }
            
            DispatchQueue.main.async {
                let imageToCache = image
                self.store.imageCache.setObject(imageToCache, forKey: urlString as AnyObject)
                self.movie?.posterImg = imageToCache
                self.posterImg.image = self.movie?.posterImg
                print("image set!")
            }
            
            
            
        }
    }
//            DispatchQueue.main.async {
//                guard let urlString = self.movie?.posterURL else { return }
//                guard let url = URL(string: urlString) else { return }
//                guard let data = NSData(contentsOf: url) else { return }
//                guard let image = UIImage(data: data as Data) else { return }
//                self.movie?.posterImg = image
//                self.posterImg.image = self.movie?.posterImg
//                print("image set!")
//            }
//            
//            
//            
//        }
//    }
    
    @IBOutlet weak var posterImg: UIImageView!
    
}
