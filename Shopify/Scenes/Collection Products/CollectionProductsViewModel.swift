//
//  CollectionProductsViewModel.swift
//  Shopify
//
//  Created by Morteza on 1/12/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

final class CollectionProductsViewModel {
  
  private let collectionId : String
  private let network: Network<Collects>
  private let productNetwork: Network<Products>

  
  init(collectionId:String) {
    self.collectionId   = collectionId
    self.network        = Network(.collects)
    self.productNetwork = Network(.products)
  }
  
  struct Input {
    let trigger: Driver<Void>
  }
  struct Output {
    let fetching: Driver<Bool>
    let items: Driver<[ProductViewModel]>
    let error: Driver<Error>
  }
  
  func transform(input: Input) -> Output {
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    let params = ["collection_id":collectionId,"page":"1","access_token":ServerConfig.token]
    
    let items = input.trigger.flatMapLatest {_ in
      
      return self.network.getItems(params: params)
        .map { $0.items.map {String($0.id)}
          .joined(separator: ",")}
        .flatMap({ (ids) -> Observable<[ProductViewModel]> in
          return self.productNetwork.getItems(params: params)
                      .map { $0.items.map { ProductViewModel($0) } }
        })
        .trackActivity(activityIndicator)
        .trackError(errorTracker)
        .asDriverOnErrorJustComplete()      
    }
    
    let fetching = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    return Output(fetching: fetching,
                  items: items,
                  error: errors)
  }
  
  
}
