//
//  UIView.swift
//  Shopify
//
//  Created by Morteza on 1/11/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//
import UIKit


extension UIView {
  func snapshot() -> UIImage {
    UIGraphicsBeginImageContextWithOptions(bounds.size, false, UIScreen.main.scale)
    drawHierarchy(in: bounds, afterScreenUpdates: true)
    let result = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return result ?? UIImage()
  }
}
