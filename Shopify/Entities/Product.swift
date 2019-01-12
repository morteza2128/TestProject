//
//  Product.swift
//  Shopify
//
//  Created by Morteza on 1/12/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

struct Product {
  
  public let id: Int
  public let title: String
  public let type: String
  public let totalAvailable: Int
  public let variants : [Variant]
  public let imageUrl: URL
  

  private enum CodingKeys: String, CodingKey {
    case id
    case title
    case type = "product_type"
    case variants
    case image
  }
  
  private enum  ImageKeys: String, CodingKey{
    case src
  }
  
  
  struct Variant :Decodable{
    
    public let id: Int
    public let title:String
    public let price: String
    public let inventoryQuantity: Int
    
    private enum CodingKeys: String, CodingKey {
      case id
      case title
      case price
      case inventoryQuantity = "inventory_quantity"
      
    }
    public init(from decoder: Decoder) throws {
      
      let container = try decoder.container(keyedBy: CodingKeys.self)
      
      id                = try container.decode(Int.self, forKey: .id)
      title             = try container.decode(String.self, forKey: .title)
      price             = try container.decode(String.self, forKey: .price)
      inventoryQuantity = try container.decode(Int.self, forKey: .inventoryQuantity)
    }
  }

}




extension Product :Decodable{
  
  public init(from decoder: Decoder) throws {
    
    let container = try decoder.container(keyedBy: CodingKeys.self)
    
    id    = try container.decode(Int.self, forKey: .id)
    title = try container.decode(String.self, forKey: .title)
    type  = try container.decode(String.self, forKey: .type)
    
    let imageContainer = try container.nestedContainer(keyedBy: ImageKeys.self, forKey: .image)
    imageUrl = try imageContainer.decode(URL.self, forKey: .src)
    
    variants = try container.decode([Variant].self, forKey: .variants)
    totalAvailable = variants.reduce(0, { sum, variant in
      sum + variant.inventoryQuantity
    })
    
  }
}


struct Products :Decodable{
  
  public let items: [Product]
  
  private enum RootKey: String, CodingKey {
    case items =  "products"
  }
  
  public init(from decoder: Decoder) throws {
    let rootContainer = try decoder.container(keyedBy: RootKey.self)
    
    items = try rootContainer.decode([Product].self, forKey: .items)
  }
  
}

