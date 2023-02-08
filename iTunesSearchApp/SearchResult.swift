//
//  SearchResult.swift
//  iTunesSearchApp
//
//  Created by Andrew Acton on 2/7/23.
//

import Foundation

class SearchResults {
    var artistName = ""
    var trackName = ""
    var itemDescription = ""
    var trackPrice = 0.00
    
    init?(json: [String: AnyObject]) {
        guard let artistName = json["artistName"] as? String,
              let trackName = json["trackName"] as? String
        else { return nil }
        
        let itemDescription = json["description"]
        let price = json["trackPrice"]
        
        self.artistName = artistName
        self.trackName = trackName
    
        if let trackP = price as? Double {
            self.trackPrice = trackP
        }
        
        if let desc = itemDescription as? String {
            self.itemDescription = desc
        }
    }
}
