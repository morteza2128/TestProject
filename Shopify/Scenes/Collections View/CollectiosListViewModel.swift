//
//  CollectiosListViewModel.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation
import RxSwift
import RxSwift
import RxCocoa



class CollectiosListViewModel {
  
  //Binding powered with RxSwift
  private let disposeBag = DisposeBag()
  
  
  private let _collections = Variable<[Collection]>([])
  var collections: Driver<[Collection]> { return _collections.asDriver() }

  private let _error = Variable<ServiceError>(ServiceError())
  var error: Driver<ServiceError> { return _error.asDriver() }
  
  
  var numberOfCollections: Int { return _collections.value.count }

  // MARK: - Public Interface
  
  func collection(at index: Int) -> Collection? {
    guard index < _collections.value.count else { return nil }
    return _collections.value[index]
  }
  
  func viewModelForCollection(at index: Int) -> CollectionRepresentable? {
    guard let collection = collection(at: index) else { return nil }
    return CollectionViewModel(collection)
  }
  
  func getCollections()  {
    
    //CollectionService.getCollections(<#T##CollectionService#>)
  }
  
}


