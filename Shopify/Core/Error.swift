//
//  Error.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

class ServiceError {
  
  var serverErrorCode: Int? {
    willSet{
      switch newValue {
      case NSURLErrorTimedOut:
        self.customCode = .timeOut
      case NSURLErrorNotConnectedToInternet,NSURLErrorNetworkConnectionLost:
        self.customCode = .network
      default:
        self.customCode = .unknown
      }
    }
  }
  
  var customCode: ErrorCodes = .unknown
  
  convenience init(customCode:ErrorCodes) {
    self.init()
    self.customCode = customCode
  }
  
  convenience init(serverErrorCode:Int) {
    self.init()
    self.serverErrorCode  = serverErrorCode
  }
  
  var message: String {
    
    switch customCode {
    case .timeOut:
      return ServerGeneralError.requestTimeOutError.localized
    case .network:
      return ServerGeneralError.noInternetConnectionError.localized
    case .json:
      return ServerGeneralError.noInternetConnectionError.localized
    case .missingKey:
      return ServerGeneralError.missingImportantKey.localized
    default:
      return ServerGeneralError.unknowError.localized
    }
    
  }

  
}

enum ErrorCodes : Int{
  case unknown     = 0
  case json        = 1
  case network     = 2
  case timeOut     = 3
  case serverError = 4
  case missingKey  = 5
  case other       = 6
  
}


