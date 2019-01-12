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
  static let token = "c32313df0d0ef512ca64d5b336a0d7c6"
  //let prort = "8080"

}

enum Endpoint: String {
  case collections = "custom_collections.json"
  case collects    = "collects.json"
  case products    = "products.json"

  var url: String {
    return rawValue
  }
}

enum JsonKeys: String{
  
  case collections = "custom_collections"
  case collects   
}
