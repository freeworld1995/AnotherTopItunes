//
//  DataSource.swift
//  TopItunes
//
//  Created by Jimmy Hoang on 1/27/17.
//  Copyright © 2017 Jimmy Hoang. All rights reserved.
//

import UIKit

class DataSource: NSObject {
    
    var songs = [Song]()
    
    func getData(completion: @escaping () -> Void) {
        let url = URL(string: "https://itunes.apple.com/us/rss/topsongs/limit=50/genre=1/explicit=true/json")
        
        let dataTask = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!)
                return
            }
            
            DispatchQueue.global().async {
                let jsonData = try! JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as! Dictionary<String, Any>
                let feed = jsonData["feed"] as! Dictionary<String, Any>
                let entries = feed["entry"] as! [Dictionary<String, Any>]
                
                entries.forEach {
                    let imName = $0["im:name"] as! Dictionary<String, Any>
                    let name = imName["label"] as! String
                    
                    let imArtist = $0["im:artist"] as! Dictionary<String, Any>
                    let artist = imArtist["label"] as! String
                    
                    let imPrice = $0["im:price"] as! Dictionary<String, Any>
                    let price  = imPrice["label"] as! String
                    
                    let imImage = $0["im:image"] as! [Dictionary<String, Any>]
                    let imageUrl = imImage[0]["label"] as! String
                    
                    let song = Song(name: name, artist: artist, imageUrl: imageUrl, price: price)
                    self.songs.append(song)
                    
                    DispatchQueue.main.async {
                        completion()
                    }
                    
                }
            }
        }
        dataTask.resume()
    }
    
}

extension DataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongCell", for: indexPath) as! SongCell
        let song = songs[indexPath.row]
//        cell.songImage.image = nil
//        cell.tag = indexPath.row
        cell.title.text = "\(song.name!)"
        cell.artist.text = "\(song.artist!)"
        cell.price.setTitle("\(song.price!)", for: .normal)
        
        cell.songImage.loadImageUsingCacheWithUrlString(urlString: song.imageUrl!)
        
        return cell
    }
}
