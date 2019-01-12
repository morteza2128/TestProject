//
//  CollectionTableViewCell.swift
//  Shopify
//
//  Created by Morteza on 1/10/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit
import SDWebImage

class CollectionTableViewCell: UITableViewCell {
  
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var dateLebel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func bind(_ collectionModel:CollectionViewModel?)  {
    
    guard  let collectionModel  = collectionModel else{
      return
    }
    self.titleLabel.text = collectionModel.title
    self.dateLebel.text  = collectionModel.date
    self.img.sd_setImage(with: collectionModel.imageUrl)
    
  }
  
  
  
}
