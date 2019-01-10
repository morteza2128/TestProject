//
//  CollectionViewModel.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

class CollectionViewModel : CollectionRepresentable{
  
  let title: String
  let imageUrl: URL?
  let handle: String
  
  init(_ collection:Collection) {
    self.title = collection.title
    self.imageUrl = collection.imageUrl
    self.handle = collection.handle
    
  }
  
}

@objc protocol CollectionRepresentable {
  
  var title: String { get }
  @objc optional var imageUrl: String { get }
  var handle: String { get }
}
