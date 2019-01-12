//
//  UIStoryboard.swift
//  Shopify
//
//  Created by Morteza on 1/11/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit

extension UIStoryboard {
  func instantiateViewController<T>(ofType type: T.Type) -> T {
    return instantiateViewController(withIdentifier: String(describing: type)) as! T
  }
}

