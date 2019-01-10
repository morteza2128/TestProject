//
//  CellProtocol.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
  
  static var reuseIdentifier: String {
    return String(describing: self)
  }
  static var nibName: String {
    return String(describing: self)
  }
}


extension UITableViewCell: ReusableView {}
extension UICollectionReusableView: ReusableView {}

extension UITableView{
  
  func register<T: UITableViewCell> (_: T.Type){
    
    let nib = UINib(nibName: T.nibName, bundle: nil)
    register(nib, forCellReuseIdentifier: T.reuseIdentifier)
  }
  
  func dequeueReusableCell <T :UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    
    guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath ) as? T else {
      fatalError("coudnot load cell with \(T.reuseIdentifier)")
    }
    return cell
  }
  
  
}
