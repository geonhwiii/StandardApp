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
   @IBOutlet weak var burgerImageView: UIImageView!
   
   override func awakeFromNib() {
      super.awakeFromNib()
      
      cardView.addShadowAndRoundedCorners()
      titleLabel.font = UIFont(name: Theme.mainFontName, size: 32)
      cardView.backgroundColor = Theme.accent
      burgerImageView.layer.cornerRadius = cardView.layer.cornerRadius
   }
   
   // MARK: - Methods
   func setup(burgerModel: BurgerModel) {
      titleLabel.text = burgerModel.title
      
      if let burgerImage = burgerModel.image {
         burgerImageView.alpha = 0.3
         burgerImageView.image = burgerImage
         
         UIView.animate(withDuration: 1) {
            self.burgerImageView.alpha = 1
         }
      }
   }
}
