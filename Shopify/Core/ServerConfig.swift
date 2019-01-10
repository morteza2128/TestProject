//
//  ServerConfig.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

class ServerResponse: NSObject {
  
  var backData : AnyObject?
  var hasError : Bool?
  var message  : String?
  var statusCode : NSInteger?
  
}

class Config: NSObject {
  
  static let sharedInstance        = Config()
  public static let server         = Server()
}

struct Server {
  let baseUrl = "https://itunes.apple.com/"
  
  //Other Server config like version port if need
}

enum Endpoint: String {
  case search   = "search/"
  
  var url: String {
    return rawValue
  }
}
