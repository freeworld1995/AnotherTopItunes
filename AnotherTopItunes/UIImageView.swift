////
////  UIImageView.swift
////  AnotherTopItunes
////
////  Created by Jimmy Hoang on 1/28/17.
////  Copyright © 2017 Jimmy Hoang. All rights reserved.
////
//
//import UIKit
//
//let imageCache = NSCache<AnyObject, AnyObject>()
//
//extension UIImageView {
//    
//    func loadImageUsingCacheWithUrlString(urlString: String, completion: @escaping () -> Void) {
//        
//        self.image = nil
//        
////        DispatchQueue.main.async {
////   
////        }
//        
//        // check cache for image first
//        if let cachedImage = imageCache.object(forKey: urlString as AnyObject) as? UIImage {
//            self.image = cachedImage
//            return
//        }
//        
//        // otherwise download the fucking image
//        let url = URL(string: urlString)
//        URLSession.shared.dataTask(with: url!, completionHandler: { (data, response, error) in
//            if error != nil {
//                print(error!)
//                return
//            }
//            
//            DispatchQueue.main.sync {
//                
//                if let downloadedImage = UIImage(data: data!) {
//                    imageCache.setObject(downloadedImage, forKey: urlString as AnyObject)
//                }
//                         completion()
//                self.image = UIImage(data: data!)
//            }
//        }).resume()
//    }
//    
//}
