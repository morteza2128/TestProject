//
//  CollectionService.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation
import ObjectMapper
import RxSwift

class CollectionService {
  
  typealias CollectionResponseCallBack = (_ collections:Observable<[Collection]>, _ error: ServiceError?) -> Void
  static let shared = CollectionService()
  
  func getCollections(complitionBlock:@escaping CollectionResponseCallBack)  {
   
//    let params = ["page":"1","access_token":ServerConfig.token]
//    NetworkingBrain.sharedInstance.sendRequest(endpoint: .collections, httpMethod: .get, parameters: params) { response,error  in
//
//      guard let backData = response?.backData, (error == nil) else{
//        complitionBlock(Observable.empty(),error)
//        return
//      }
//      guard let collections = Mapper<Collection>().mapArray(JSONObject: backData[JsonKeys.collections.rawValue] as? [Any] ) else {
//        let jsonError = ServiceError(customCode: .missingKey)
//        complitionBlock(Observable.empty(),jsonError)
//        return
//      }
//      complitionBlock(Observable.of(collections),nil)
//    }

    
  }
  
  func getCollects()  {
  }
  
  func getProducts()  {
  }
  
  
}
