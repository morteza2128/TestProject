//
//  CollectiosListViewModel.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa



final class CollectionsListViewModel {
  
  //Binding powered with RxSwift
  //private let disposeBag = DisposeBag()
  private let network: Network<Collections>

  init() {
    network = Network(.collections)
  }
  
  struct Input {
    let trigger: Driver<Void>
    let selection: Driver<IndexPath>
  }
  struct Output {
    let fetching: Driver<Bool>
    let items: Driver<[CollectionViewModel]>
    let error: Driver<Error>
    let selectedCollection: Driver<Collection>

  }
  
  func transform(input: Input) -> Output {
    let activityIndicator = ActivityIndicator()
    let errorTracker = ErrorTracker()
    let params = ["page":"1","access_token":ServerConfig.token]

    let items = input.trigger.flatMapLatest {_ in      
      return self.network.getItems(params: params)
        .trackActivity(activityIndicator)
        .trackError(errorTracker)
        .asDriverOnErrorJustComplete()
        .map { $0.items.map { CollectionViewModel($0) } }
    }
    
    let selectedPost = input.selection.withLatestFrom(items){ (indexPath, posts) -> Collection in
      return posts[indexPath.row].collection
    }

    
    let fetching = activityIndicator.asDriver()
    let errors = errorTracker.asDriver()
    return Output(fetching: fetching,
                  items: items,
                  error: errors,
                  selectedCollection: selectedPost)
  }


  //I Use to use RX in view model like this
  
//  private let _collections = Variable<[Collection]>([])
//  var collections: Driver<[Collection]> { return _collections.asDriver() }
//
//  private let _error = Variable<ServiceError>(ServiceError())
//  var error: Driver<ServiceError> { return _error.asDriver() }
//
//
//
//  var numberOfCollections: Int { return _collections.value.count }
//
//  // MARK: - Public Interface
//
//  func collection(at index: Int) -> Collection? {
//    guard index < _collections.value.count else { return nil }
//    return _collections.value[index]
//  }
//
//  func viewModelForCollection(at index: Int) -> CollectionRepresentable? {
//    guard let collection = collection(at: index) else { return nil }
//    return CollectionViewModel(collection)
//  }
//
//  func getCollections()  {
//    CollectionService.shared.getCollections { [weak self](collections, error) in
//
////      guard let strongSelf = self else{
////        return
////      }
////      strongSelf._collections.value = collections
////      if let error = error{
////        strongSelf._error.value = error
////      }
////      strongSelf._refreshing.value = false
//
//    }
//  }
  
}


