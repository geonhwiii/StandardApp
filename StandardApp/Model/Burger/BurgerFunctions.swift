//
//  BurgerFunctions.swift
//  StandardApp
//
//  Created by 정건휘 on 27/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class BurgerFunctions {
   // CRUD
   static func createBurger(burgerModel: BurgerModel) {
      Data.burgerModels.append(burgerModel)
   }
   
   static func readBurger(completion: @escaping () -> ()) {
      DispatchQueue.global().async {
         if Data.burgerModels.count == 0 {
            Data.burgerModels.append(BurgerModel(title: "SingleBurger"))
            Data.burgerModels.append(BurgerModel(title: "DoubleBurger"))
            Data.burgerModels.append(BurgerModel(title: "CheezeBurger"))
         }
      }
      DispatchQueue.main.async {
         completion()
      }
      
   }
   
   static func updateBurger() {
      
   }
   
   static func deleteBurger() {
      
   }
   
   
}
