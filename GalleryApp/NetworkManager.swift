//
//  NetworkManager.swift
//  GalleryApp
//
//  Created by Deepak Agrawal on 28/12/20.
//

import Foundation
import Alamofire


//class NetworkManager {
//    private let alamofireManager : Alamofire.Session
//    static var sharedManager : NetworkManager = {
//        let manager = NetworkManager()
////        do {
////            try manager.reachability = Reachability()
////        } catch let err {
////            print("Err", err)
////        }
//
////        NotificationCenter.default.addObserver(manager, selector: #selector(NetworkManager.reachabilityChanged(note:)),name: Notification.Name.reachabilityChanged,object: manager.reachability)
//        return manager
//    }()
//    //var api_token : String?
//    //var reachability: Reachability?
//
//    init() {
//        alamofireManager = Alamofire.Session.default
//        alamofireManager.session.configuration.timeoutIntervalForRequest = 30
//        //api_token = UserDefaults.standard.value(forKey: "api_token") as? String ?? ""
//    }
//
//    func createRequest(with request : CJWebRequestProtocol)->Alamofire.DataRequest?{
////        if reachability?.connection == Reachability.Connection.unavailable || reachability?.connection.description == "No Connection"{
////            showNoNetworkMessage()
////            return nil
////        }
////        guard  let endPoint = request.endPoint else {
////            return nil
////        }
//
//        return alamofireManager.request(request.baseUrl.appendingPathComponent(Constants.Flickr.endpoint), method: request.requestType, parameters: request.parameters, encoding: request.parameterEncoding, headers: nil)
//    }
//
////    @objc func reachabilityChanged(note: NSNotification) {
////        let reachability = note.object as! Reachability
////        if reachability.connection != .unavailable || reachability.connection.description == "No Connection" {
////
////        } else {
////            DispatchQueue.main.async {
////                self.showNoNetworkMessage()
////            }
////        }
////    }
////
////    func showNoNetworkMessage(){
////
////        let networkAlert = UIAlertController(title: NSLocalizedString("Alert_title", comment: "Alert title"), message: NSLocalizedString("Network_Alert", comment: "Network Alert"), preferredStyle: .alert)
////        networkAlert.addAction(UIAlertAction(title: NSLocalizedString("Alert_OK_Title", comment: "Alert_OK_Title"), style: UIAlertAction.Style.default, handler: nil))
////        UIApplication.shared.keyWindow?.rootViewController?.present(networkAlert, animated: true, completion: {})
////    }
//
//    // Remove square brackets for POST request
//    class func getResponse(with request : CJWebRequestProtocol,completionHandler : @escaping([String:Any]?,Error?)->Void){
//
//        if let alamofireRequest = sharedManager.createRequest(with: request){
//
//            alamofireRequest.responseJSON { (response) in
//                debugPrint(response.result)
//                switch(response.result){
//                case .success(let data):
//                    debugPrint(data)
//                    if let dictdata = data as? [String:Any]{
//                        completionHandler(dictdata ,nil)
//                    }else{
//                        //RappleActivityIndicatorView.stopAnimation(completionIndicator: .none, completionLabel: "", completionTimeout: 1)
//                        let networkAlert = UIAlertController(title: NSLocalizedString("Alert_title", comment: "Alert title"), message: "Please try again", preferredStyle: .alert)
//                        networkAlert.addAction(UIAlertAction(title: NSLocalizedString("Alert_OK_Title", comment: "Alert_OK_Title"), style: UIAlertAction.Style.default, handler: nil))
//                        UIApplication.shared.keyWindow?.rootViewController?.present(networkAlert, animated: true, completion: {})
//                    }
//                    break
//                case .failure(let error):
//                    let Error = error as NSError
//                        print(Error.code)
//                        //RappleActivityIndicatorView.stopAnimation(completionIndicator: .none, completionLabel: "", completionTimeout: 1)
//                        if Error.code == 1001 {
//                            let networkAlert = UIAlertController(title: NSLocalizedString("Alert_title", comment: "Alert title"), message: "Your Internet conenction is slow!", preferredStyle: .alert)
//                            networkAlert.addAction(UIAlertAction(title: NSLocalizedString("Alert_OK_Title", comment: "Alert_OK_Title"), style: UIAlertAction.Style.default, handler: nil))
//                            UIApplication.shared.keyWindow?.rootViewController?.present(networkAlert, animated: true, completion: {})
//                        }
//
//                    completionHandler(nil,error)
//                    break
//                }
//            }
//        }
//    }
//}
//
//extension NetworkManager{
//
//    class func alamofireRequest(url: String!, httpMethod: String, details: [String : AnyObject], completionHandler: @escaping (_ status: Any?, _ error: NSError?) -> ()) {
//        if let URL = URL(string: url) {
//            let request = NSMutableURLRequest(url: URL)
//            request.httpMethod = httpMethod
//            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
////            if let userToekn = NetworkManager.sharedManager.api_token{
////                request.setValue(userToekn, forHTTPHeaderField: "Authorization")
////            }
//            if details.count > 0 {
//                request.httpBody = try! JSONSerialization.data(withJSONObject: details, options: [])
//            }
//            AF.request(request as URLRequest)
//                .responseJSON { response in
//                    switch response.result {
//                    case .failure(let error):
//                        DispatchQueue.global().async {
//                            DispatchQueue.main.async {
//                                // print("error is \(error)")
//                                completionHandler(nil,error as NSError)
//                            }
//                        }
//                    case .success(let responseObject):
//                        DispatchQueue.global().async {
//                            //let json : JSON =  JSON(responseObject)
//                            DispatchQueue.main.async {
//                                print("success is \(responseObject)")
//                                completionHandler(responseObject, nil)
//                            }
//                        }
//                    }
//            }
//        }
//    }
//}
//
//
////// Remove square brackets for GET request
////struct CustomGetEncoding: ParameterEncoding {
////    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
////        var request = try URLEncoding().encode(urlRequest, with: parameters)
////        request.url = URL(string: request.url!.absoluteString.replacingOccurrences(of: "%5B%5D=", with: "="))
////        return request
////    }
////}
////
////// Remove square brackets for POST request
////struct CustomPostEncoding: ParameterEncoding {
////    func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
////        var request = try URLEncoding().encode(urlRequest, with: parameters)
////        let httpBody = NSString(data: request.httpBody!, encoding: String.Encoding.utf8.rawValue)!
////        request.httpBody = httpBody.replacingOccurrences(of: "%5B%5D=", with: "=").data(using: .utf8)
////        return request
////    }
////}

class NetworkManager {
    
    func getPhotos( completionHandler:@escaping([Photo]) -> Void){
        
        let request = AF.request("https://api.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=\(Constants.Flickr.key)&format=json&nojsoncallback=1")
        
        request.responseDecodable(of: FlickrData.self) { (response) in
          guard let flickrData = response.value else { return }
            completionHandler(flickrData.photos.photo)
        }
    }
}

