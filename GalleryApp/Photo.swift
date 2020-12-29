//
//  Photo.swift
//  GalleryApp
//
//  Created by Deepak Agrawal on 28/12/20.
//

import Foundation

struct Photo:Decodable{
    var id:String
    var owner:String
    var secret:String
    var server:String
    var farm:Int
    var title:String
    
//    init() {
//        self.id = ""
//        self.owner = ""
//        self.secret = ""
//        self.server = ""
//        self.farm = 0
//        self.title = ""
//    }
    
    func flickrImageURL(_ size: String = "m") -> URL? {
      if let url =  URL(string: "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_\(size).jpg") {
        return url
      }
      return nil
    }
}

struct Photos:Decodable {
    var page:Int
    var pages:Int
    var perpage:Int
    var total:Int
    var photo:[Photo]
}

struct FlickrData:Decodable {
    var photos:Photos
}
