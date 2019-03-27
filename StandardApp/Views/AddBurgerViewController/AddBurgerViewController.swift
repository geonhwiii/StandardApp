//
//  AddBurgerViewController.swift
//  StandardApp
//
//  Created by 정건휘 on 27/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit

class AddBurgerViewController: UIViewController {
   
   // MARK: - Properties
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var burgerTextField: UITextField!
   @IBOutlet weak var cancelButton: UIButton!
   @IBOutlet weak var saveButton: UIButton!
   
   // MARK: - Life cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      
      
      titleLabel.font = UIFont(name: Theme.mainFontName, size: 26)
      
   }
   
   // MARK: - Methods
   @IBAction func cancel(_ sender: Any) {
      dismiss(animated: true, completion: nil)
   }
   
   @IBAction func save(_ sender: Any) {
      dismiss(animated: true, completion: nil)
   }
   
}
