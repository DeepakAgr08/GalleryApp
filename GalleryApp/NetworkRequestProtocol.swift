//
//  NetworkRequestProtocol.swift
//  GalleryApp
//
//  Created by Deepak Agrawal on 28/12/20.
//

import Foundation
import Alamofire

protocol CJWebRequestProtocol {
    var baseRequest : CJWebServiceRequest{ get set}
}
extension CJWebRequestProtocol{
    var baseUrl : URL{
        get{
            return self.baseRequest.baseURL
        }
        set{
            self.baseRequest.baseURL = newValue
        }
    }
    var endPoint: String?{
        get{
            return self.baseRequest.endPoint
        }
        set{
            return self.baseRequest.endPoint = newValue
        }
    }
    var requestType : Alamofire.HTTPMethod{
        get{
            return self.baseRequest.requestType
        }
        set{
            self.baseRequest.requestType = newValue
        }
    }
    var parameterEncoding : ParameterEncoding{
        get{
            return self.baseRequest.parameterEncoding
        }
        set{
            self.baseRequest.parameterEncoding = newValue
        }
    }
    var parameters : [String : Any]?{
        get{
            return self.baseRequest.parameters
        }
        set{
            if newValue == nil{
                self.baseRequest.parameters = [ : ]
            }else{
                for (Key,value) in newValue!{
                    self.baseRequest.parameters?[Key] = value
                }
            }
        }
    }
    var headers : [String : String]?{
        get{
            return self.baseRequest.headers
        }
        set{
            if newValue == nil{
                self.baseRequest.headers = [ : ]
            }else{
                for (key,value) in newValue!{
                    self.baseRequest.headers?[key] = value
                }
            }
        }
    }
}
