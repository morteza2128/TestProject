//
//  CollectionService.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

class CollectionService {
  
  typealias CollectionResponseCallBack = (_ collections:[Collection], _ error: ServiceError) -> Void
  static let shared = CollectionService()
  
  func getCollections(complitionBlock:CollectionResponseCallBack)  {
   
//    NetworkingBrain.sharedInstance.sendRequest(endpoint: .collections, httpMethod: .get) { serverResponse in
//      
//      complitionBlock
//    }
  }
  
  func getCollects()  {
    
  }
  
  func getProducts()  {
    
  }
  
  
}
