//
//  Collection.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation
import ObjectMapper
//
//class Collection:Mappable {
//
//  var id: Int = 0
//  var title: String = "-"
//  var imageUrl: URL?
//  var handle: String = "-"
//  var date: String = "-"
//
//
//  required init?(map: Map) {
//
//  }
//
//  func mapping(map: Map) {
//
//    handle <- map["handle"]
//    id <- map["id"]
//    imageUrl  <- (map["image.src"],RelatedUrlTransform())
//    title  <- map["title"]
//    date  <- map["updated_at"]
//
//  }
//}

//
//open class RelatedUrlTransform: TransformType {
//
//  public typealias Object = URL
//  public typealias JSON   = String
//
//  public func transformFromJSON(_ value: Any?) -> URL? {
//
//    guard let url = URL(string: value as? String ?? "-") else{
//      return nil
//    }
//    return url
//  }
//
//  public func transformToJSON(_ value: URL?) -> String? {
//    return value?.absoluteString
//  }
//
//}

public struct Collection {
  
  public let id: Int
  public let title: String
  public let imageUrl: URL
  public let handle: String
  public let date: String

  
  private enum CodingKeys: String, CodingKey {
    case id
    case title
    case handle
    case date = "updated_at"
    case image
  }
  
  private enum  ImageKeys: String, CodingKey{
    case src
  }
}

extension Collection :Decodable{
  
  public init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
  
    id = try container.decode(Int.self, forKey: .id)
    title = try container.decode(String.self, forKey: .title)
    handle = try container.decode(String.self, forKey: .handle)
    date = try container.decode(String.self, forKey: .date)
    let imageContainer = try container.nestedContainer(keyedBy: ImageKeys.self, forKey: .image)
    imageUrl = try imageContainer.decode(URL.self, forKey: .src)
  
  }
}


struct Collections :Decodable{
  
  public let items: [Collection]
  
  private enum RootKey: String, CodingKey {
    case items =  "custom_collections"
  }
  
  public init(from decoder: Decoder) throws {
    let rootContainer = try decoder.container(keyedBy: RootKey.self)
    
    items = try rootContainer.decode([Collection].self, forKey: .items)

  }

}

