//
//  CustomViewController.swift
//  Shopify
//
//  Created by Morteza on 1/11/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit
import SVProgressHUD
import then

class CustomVC: UIViewController {
  
  private(set) var navigator: Navigator!
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  static func createVCWith<T:CustomVC>(type: T.Type, navigator: Navigator, storyboard: UIStoryboard) -> T {
    
    return storyboard.instantiateViewController(ofType: T.self).then { vc in
      vc.navigator = navigator
    }
  }
  
  func show(segue: Segue, sender: UIViewController, style:PresentStyle) {
    navigator.show(segue: segue, sender: sender, style: style)
  }
  
  func dismissProgressView() {
    SVProgressHUD.dismiss()
  }
  
}
