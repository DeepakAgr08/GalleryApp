//
//  NetworkRequest.swift
//  GalleryApp
//
//  Created by Deepak Agrawal on 28/12/20.
//

import Foundation
import Alamofire

struct CJWebServiceRequest{
    var baseURL : URL
    var endPoint: String?
    var requestType: Alamofire.HTTPMethod
    var parameterEncoding : ParameterEncoding
    var parameters: [String: Any]?
    var headers : [String : String]?
    init() {
        self.baseURL = URL(string: Constants.Flickr.baseUrl)!
        self.requestType = .get
        self.parameterEncoding = URLEncoding.default
        self.parameters = [ : ]
//        if let token = CJWebServicesManager.sharedManager.api_token{
//            self.headers = ["Authorization": "Bearer " + token]
//        }else{
//            self.headers = [ : ]
//        }
    }
}
