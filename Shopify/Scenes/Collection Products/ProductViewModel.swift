//
//  CollectDataModel.swift
//  Shopify
//
//  Created by Morteza on 1/12/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

struct ProductViewModel {
  
  let product :  Product
  let title : String
  let type : String
  let availableCount: String
  let imageurl : URL
  
  init(_ product: Product) {
    
    self.product        = product
    self.title          = product.title
    self.type           = product.type
    self.availableCount = String(product.totalAvailable)
    self.imageurl       = product.imageUrl
    
  }
  
}


