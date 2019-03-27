//
//  UIButtonExtensions.swift
//  StandardApp
//
//  Created by 정건휘 on 27/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

extension UIButton {
   
   func createFloatingActionButton() {
      layer.shadowOpacity = 0.25
      layer.shadowOffset = CGSize(width: 0, height: 10)
      layer.shadowRadius = 5
      tintColor = Theme.tintColor
   }
   
}
