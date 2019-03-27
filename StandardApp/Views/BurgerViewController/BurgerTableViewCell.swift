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
      titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
      cardView.backgroundColor = Theme.accent
   }
   
   // MARK: - Methods
   func setup(burgerModel: BurgerModel) {
      titleLabel.text = burgerModel.title
   }
}
