//
//  BurgerViewController.swift
//  StandardApp
//
//  Created by 정건휘 on 27/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit
// MARK: - identifier
let reuseIdentifier = "burgerCell"

class BurgerViewController: UIViewController {
   
   // MARK: - Properties
   @IBOutlet weak var tableView: UITableView!
   @IBOutlet weak var addButton: UIButton!
   
   // MARK: - Life cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      view.backgroundColor = Theme.background
      addButton.createFloatingActionButton()
      
      BurgerFunctions.readBurger { [weak self] in
         // completion
         self?.tableView.reloadData()
         self?.tableView.delegate = self
         self?.tableView.dataSource = self
      }
      
      
      
      
   }
}

// MARK: - UITableView DataSource
extension BurgerViewController: UITableViewDataSource {
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return Data.burgerModels.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! BurgerTableViewCell
      cell.setup(burgerModel: Data.burgerModels[indexPath.row])
      
      return cell
   }
   
   
   
}


// MARK: - UITableview Delegate
extension BurgerViewController: UITableViewDelegate {
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
      return 160
   }
   
}
