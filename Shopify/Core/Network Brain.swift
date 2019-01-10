//
//  Network Brain.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

import Alamofire

class NetworkingBrain {
  
  static let sharedInstance = NetworkingBrain()
  
  typealias ServerResponseCallBack = (ServerResponse?,ServiceError?) -> Void
  
  func sendRequest(endpoint:Endpoint, httpMethod:HTTPMethod, parameters:[String: Any]? = nil, headers:[String:String]? = nil, isFirstPage: Bool = true, callback: @escaping ServerResponseCallBack) {
    
    let url = isFirstPage ? (ServerConfig.baseUrl + endpoint.url) : endpoint.url
    Alamofire.request( url , method: httpMethod, parameters: parameters , headers: headers)
      .validate(statusCode: 200..<500)
      .responseJSON { response in
        
        var serverError : ServiceError
        var serverResponse = ServerResponse(statusCode: response.response?.statusCode ?? -1)
        
        switch response.result {
          
        case .success:
          
          if let JSON = response.result.value {
            print("JSON: \(JSON)")
            serverResponse.backData = JSON as AnyObject?
            callback(serverResponse,nil)

          }else{
            serverResponse.backData  = nil
            serverError = ServiceError(customCode: .json)
            callback(serverResponse,serverError)
          }
          
          
        case .failure(let responError):
          
          do {
            //It's depend on server implementation to send message in error responsees or not
            //There is change to parse server error
            let jsonResult = try JSONSerialization.jsonObject(with: response.data!, options:
              JSONSerialization.ReadingOptions.mutableContainers)
            serverResponse.backData = jsonResult as AnyObject
            
          } catch {
            serverResponse.backData = nil
          }
          serverError = ServiceError(serverErrorCode: responError._code)
          callback(serverResponse, serverError)
          
        }
        
    }
    
  }
  
  
}



