//
//  CollectionProductsTableViewCell.swift
//  Shopify
//
//  Created by Morteza on 1/12/19.
//  Copyright © 2019 Morteza Hosseini Zadeh. All rights reserved.
//

import UIKit

class CollectionProductsTableViewCell: UITableViewCell {
  
  @IBOutlet weak var img: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var type: UILabel!
  @IBOutlet weak var avilableCount: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    self.img?.layer.masksToBounds = true
    
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }
  
  func bind(_ productModel:ProductViewModel?)  {
    
    guard  let productModel  = productModel else{
      return
    }
    self.titleLabel.text    = productModel.title
    self.type.text          = productModel.type
    self.avilableCount.text = "Count: \(productModel.availableCount)"
    self.img.sd_setImage(with: productModel.imageurl)
    
  }
}
