//
//  BurgerModel.swift
//  StandardApp
//
//  Created by 정건휘 on 27/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class BurgerModel {
   var id: UUID
   var title: String
   var image: UIImage?
   
   init(title: String, image: UIImage? = nil) {
      id = UUID()
      self.title = title
      self.image = image
   }
}
