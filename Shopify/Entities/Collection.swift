//
//  Collection.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation
import ObjectMapper

class Collection:Mappable {
  
  var id: Int = 0
  var title: String = "-"
  var imageUrl: URL?
  var handle: String = "-"

  
  required init?(map: Map) {
    
  }
  
  func mapping(map: Map) {
    
    handle <- map["collectionName"]
    id <- map["artistName"]
    imageUrl  <- (map["artworkUrl100"],RelatedUrlTransform())
    title  <- map["trackCount"]
    
  }
}


open class RelatedUrlTransform: TransformType {
  
  public typealias Object = URL
  public typealias JSON   = String
  
  public func transformFromJSON(_ value: Any?) -> URL? {
    
    guard let url = URL(string: value as? String ?? "-") else{
      return nil
    }
    return url
  }
  
  public func transformToJSON(_ value: URL?) -> String? {
    return value?.absoluteString
  }
  
}
