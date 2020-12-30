//
//  NetworkManager.swift
//  GalleryApp
//
//  Created by Deepak Agrawal on 28/12/20.
//

import Foundation
import Alamofire

class NetworkManager {
    
    func getPhotos( completionHandler:@escaping([Photo]) -> Void){
        
        let request = AF.request("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=\(Constants.Flickr.key)&format=json&nojsoncallback=1")
        
        request.responseDecodable(of: FlickrData.self) { (response) in
          guard let flickrData = response.value else { return }
            completionHandler(flickrData.photos.photo)
        }
    }
}

