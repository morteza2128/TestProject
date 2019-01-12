//
//  UIWindow+.swift
//  Shopify
//
//  Created by Morteza on 1/11/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit

extension UIWindow {
  func replaceRootViewControllerWith(_ replacementController: UIViewController, animated: Bool, completion: (() -> Void)?) {
    let snapshotImageView = UIImageView(image: self.snapshot())
    self.addSubview(snapshotImageView)
    
    let dismissCompletion = { () -> Void in // dismiss all modal view controllers
      self.rootViewController = replacementController
      self.bringSubviewToFront(snapshotImageView)
      if animated {
        UIView.animate(withDuration: 0.4, animations: { () -> Void in
          snapshotImageView.alpha = 0
        }, completion: { (success) -> Void in
          snapshotImageView.removeFromSuperview()
          completion?()
        })
      }
      else {
        snapshotImageView.removeFromSuperview()
        completion?()
      }
    }
    if self.rootViewController!.presentedViewController != nil {
      self.rootViewController!.dismiss(animated: false, completion: dismissCompletion)
    }
    else {
      dismissCompletion()
    }
  }
}
