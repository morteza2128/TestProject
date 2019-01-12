//
//  CollectionViewModel.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

struct CollectionViewModel {
  
  let title: String
  let imageUrl: URL?
  let date: String
  let collection : Collection
  
  init(_ collection:Collection) {
    self.collection = collection
    self.title      = collection.title
    self.imageUrl   = collection.imageUrl
    self.date       = collection.date
    
  }
  
}
