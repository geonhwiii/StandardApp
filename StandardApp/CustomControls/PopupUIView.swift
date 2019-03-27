//
//  PopupUIView.swift
//  StandardApp
//
//  Created by 정건휘 on 27/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class PopupUIView: UIView {
   
   required init?(coder aDecoder: NSCoder) {
      super.init(coder: aDecoder)
      
      layer.shadowOpacity = 1
      layer.shadowOffset = CGSize.zero
      layer.shadowColor = UIColor.darkGray.cgColor
      layer.cornerRadius = 10
      
      backgroundColor = Theme.backgroundColor
   }
   
}
