//
//  CollectionsListViewController.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class CollectionsListViewController: CustomVC {
  
  
  //View Model Properties
  private let disposeBag = DisposeBag()
  var viewModel : CollectionsListViewModel!
  
  //UI Properties
  @IBOutlet weak var tableView: UITableView!
  
  //MARK: - View Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    bindViewModel()
  }
  
  func setupUI()  {
    tableView.refreshControl = UIRefreshControl()
    tableView.rowHeight = UITableView.automaticDimension
    tableView.register(CollectionTableViewCell.self)

  }
  
  
  //MARK: - Faild Alert
  var errorBinding: Binder <Error> {
    return Binder(self, binding: { (vc, error) in
      let alert = UIAlertController(title: "Error",
                                    message: error.localizedDescription,
                                    preferredStyle: .alert)
      let action = UIAlertAction(title: "Dismiss",
                                 style: UIAlertAction.Style.cancel,
                                 handler: nil)
      
      alert.addAction(action)
      vc.present(alert, animated: true, completion: nil)
    })
  }
  
  
  //MARK: - Delegates & Binding
  func bindViewModel() {
    assert(viewModel != nil)
    let viewWillAppear = rx.sentMessage(#selector(UIViewController.viewWillAppear(_:)))
      .mapToVoid()
      .asDriverOnErrorJustComplete()
    
    let pull = tableView.refreshControl!.rx
      .controlEvent(.valueChanged)
      .asDriver()
    
    let input = CollectionsListViewModel.Input(trigger: Driver.merge(viewWillAppear, pull),
                                     selection: tableView.rx.itemSelected.asDriver())
    let output = viewModel.transform(input: input)
    
    output.items.drive(tableView.rx.items(cellIdentifier: CollectionTableViewCell.reuseIdentifier, cellType: CollectionTableViewCell.self)) { tv, viewModel, cell in
      cell.bind(viewModel)
      
      }.disposed(by: disposeBag)
    
    output.fetching
      .drive(tableView.refreshControl!.rx.isRefreshing)
      .disposed(by: disposeBag)
    
    output.error
      .drive(errorBinding)
      .disposed(by: disposeBag)
    
    output.selectedCollection.drive(onNext: { collection in
      self.navigator.show(segue: .collectionProducts(collectionId: collection.id), sender: self, style: .push)
    })
      .disposed(by: disposeBag)

    
    
  }

}

