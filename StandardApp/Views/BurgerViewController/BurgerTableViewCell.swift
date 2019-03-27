//
//  BurgerTableViewCell.swift
//  StandardApp
//
//  Created by 정건휘 on 27/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class BurgerTableViewCell: UITableViewCell {
   // MARK: - Properties
   @IBOutlet weak var cardView: UIView!
   @IBOutlet weak var titleLabel: UILabel!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      
      cardView.addShadowAndRoundedCorners()
      
      cardView.layer.shadowOpacity = 1
      cardView.layer.shadowOffset = CGSize.zero
      cardView.layer.shadowColor = UIColor.darkGray.cgColor
      cardView.layer.cornerRadius = 10
      
   }
   
   // MARK: - Methods
   func setup(burgerModel: BurgerModel) {
      titleLabel.text = burgerModel.title
   }
}
