//
//  AppDelegate.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let navigator = Navigator()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    fillWindowRootVC()

    return true
  }
  
  func fillWindowRootVC(){
    
    let dumyVC = UIViewController()
    window =  UIWindow(frame: UIScreen.main.bounds)
    window?.rootViewController = dumyVC
    self.window?.makeKeyAndVisible()

    self.navigator.show(segue:.collecionsView, sender: nil, style: .root(withNav: true))

  }

}

