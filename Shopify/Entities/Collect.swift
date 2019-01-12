//
//  Collect.swift
//  Shopify
//
//  Created by Morteza on 1/12/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

public struct Collect{
  
  public let id: Int
  public let collectionId: Int
  public let productId: Int
  
  private enum CodingKeys: String, CodingKey {
    case id
    case collectionId = "collection_id"
    case productId = "product_id"
  }
}


extension Collect : Decodable{
  
  public init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id           = try container.decode(Int.self, forKey: .id)
    collectionId = try container.decode(Int.self, forKey: .collectionId)
    productId    = try container.decode(Int.self, forKey: .productId)
  }
}


struct Collects :Decodable{
  
  public let items: [Collect]
  
  private enum RootKey: String, CodingKey {
    case items =  "collects"
  }
  
  public init(from decoder: Decoder) throws {
    let rootContainer = try decoder.container(keyedBy: RootKey.self)
    
    items = try rootContainer.decode([Collect].self, forKey: .items)
  }
  
}
