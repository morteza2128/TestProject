//
//  ServerConfig.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

struct ServerResponse {
  
  var backData : AnyObject?
  let statusCode : Int
  
  init(statusCode:Int = -1) {
    self.statusCode = statusCode
  }
  
  
  
}

struct ServerConfig {
  static let baseUrl = "https://shopicruit.myshopify.com/admin/"
  //let prort = "8080"
  
  //https://shopicruit.myshopify.com/admin/custom_collections.json?page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6
  //https://shopicruit.myshopify.com/admin/collects.json?collection_id=68424466488&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6
  //https://shopicruit.myshopify.com/admin/products.json?ids=2759137027,2759143811&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6
  
  //Other Server config like version port if need
}

enum Endpoint: String {
  case collections = "custom_collections.json"
  case collects    = "collects.json"
  case products    = "products.json"

  var url: String {
    return rawValue
  }
}
