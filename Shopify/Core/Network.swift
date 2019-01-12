//
//  Network.swift
//  Shopify
//
//  Created by Morteza on 1/11/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import Foundation

import RxAlamofire
import RxSwift

final class Network<T: Decodable> {
  
  private let endPoint: Endpoint
  private let scheduler: ConcurrentDispatchQueueScheduler
  
  init(_ endPoint: Endpoint) {
    self.endPoint = endPoint
    self.scheduler = ConcurrentDispatchQueueScheduler(qos: DispatchQoS(qosClass: DispatchQoS.QoSClass.background, relativePriority: 1))
  }
  
  func getItems(params:[String:String]) -> Observable<T> {
    let url = ServerConfig.baseUrl + endPoint.url
    return RxAlamofire
      .data(.get, url,parameters: params)
      .debug()
      .observeOn(scheduler)
      .map({ data -> T in
        return try JSONDecoder().decode(T.self, from: data)
      })
  }
  
    
}
