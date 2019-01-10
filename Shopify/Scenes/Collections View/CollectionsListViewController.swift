//
//  CollectionsListViewController.swift
//  Shopify
//
//  Created by Morteza on 1/9/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit
import RxSwift

class CollectionsListViewController: UIViewController {
  
  
  //View Model Properties
  private let disposeBag = DisposeBag()
  var viewModel : CollectiosListViewModel!
  
  //UI Properties
  @IBOutlet weak var tableView: UITableView!
  
  //MARK: - View Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  
  //MARK: - Logics
  func setDelegatesAndBinders() {
    
    self.tableView.delegate = self
    self.tableView.dataSource = self
    
    viewModel.collections.drive(onNext: {[weak self] _ in
      self!.tableView.reloadData()
    })
      .disposed(by: disposeBag)
  }
  
  
}

//MARK: - TableView

extension CollectionsListViewController :UITableViewDataSource{
  
  func numberOfSections(in tableView: UITableView) -> Int {
    
    return 1
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 10
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as UITableViewCell
    
    return cell
  }
}

extension CollectionsListViewController : UITableViewDelegate{
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
  }
}
