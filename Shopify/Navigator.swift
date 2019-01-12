//
//  Navigator.swift
//  Shopify
//
//  Created by Morteza on 1/11/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit

protocol ViewModel {}

enum Segue {
  case collecionsView
  case collectionProducts(collectionId:Int)
}

enum PresentStyle {
  case modal
  case push
  case root(withNav:Bool)
}


class Navigator {
  
  lazy private var defaultStoryboard = UIStoryboard(name: "Main", bundle: nil)
  
  
  func show(segue: Segue, sender: UIViewController?,  style:PresentStyle = .push) {
    
    var st = defaultStoryboard
    if let sender = sender{
      st = sender.storyboard ?? defaultStoryboard
    }
    
    
    switch segue {
    case .collecionsView:
      let vm  = CollectionsListViewModel()
      let vc  = CustomVC.createVCWith(type: CollectionsListViewController.self, navigator: self, storyboard:st)
      vc.viewModel = vm
      show(target: vc, sender: sender, style: style)
      
    case .collectionProducts(let collectionId):

      let vm = CollectionProductsViewModel(collectionId: String(collectionId))
      let vc = CustomVC.createVCWith(type: CollectionProductsViewController.self, navigator: self, storyboard: st)
      vc.viewModel  = vm
      show(target: vc, sender: sender, style:style)
    }
    
  }
  
  
  private func show(target: UIViewController, sender: UIViewController?, style:PresentStyle) {
    
    switch style {
    case .modal:
      guard let sender = sender else{
        print("Sender Missing")
        return
      }
      sender.present(target, animated: true, completion: nil)
      
    case .push:
      
      if let sender = sender, let nav = sender.navigationController {
        nav.pushViewController(target, animated: true)
      }
      else{
        let navVC = UINavigationController(rootViewController: target)
        UIApplication.shared.keyWindow!.replaceRootViewControllerWith(navVC, animated: true, completion: nil)
      }
      return
      
      
    case .root(withNav: let needNav):
      
      var replacmentVC : UIViewController
      if needNav {
        replacmentVC = UINavigationController(rootViewController: target)
      }
      else{
        replacmentVC = target
      }
      
      UIApplication.shared.keyWindow!.replaceRootViewControllerWith(replacmentVC, animated: true, completion: nil)
      
    }
  }
}
