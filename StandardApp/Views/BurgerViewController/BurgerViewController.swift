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
   @IBOutlet var helpView: UIVisualEffectView!
   
   var burgerIndexToEdit: Int?
   var seenHelpView = "seenHelpView"
   
   // MARK: - Life cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      self.tableView.delegate = self
      self.tableView.dataSource = self
      
      view.backgroundColor = Theme.backgroundColor
      addButton.createFloatingActionButton()
      
      BurgerFunctions.readBurger { [unowned self] in
         // completion
         self.tableView.reloadData()
         if Data.burgerModels.count > 0 {
            if UserDefaults.standard.bool(forKey: self.seenHelpView) == false {
               self.view.addSubview(self.helpView)
               self.helpView.frame = self.view.frame
            }
         }
      }
      
      
      
   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      if segue.identifier == "toAddBurgerSegue" {
         let popup = segue.destination as! AddBurgerViewController
         popup.burgerIndexToEdit = self.burgerIndexToEdit
         popup.doneSaving = { [weak self] in
            self?.tableView.reloadData()
         }
         burgerIndexToEdit = nil
      }
   }
   @IBAction func closeHelpView(_ sender: Any) {
      UIView.animate(withDuration: 0.5, animations: {
         self.helpView.alpha = 0
      }) { (success) in
         self.helpView.removeFromSuperview()
         UserDefaults.standard.set(true, forKey: self.seenHelpView)
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
   
   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
      let burger = Data.burgerModels[indexPath.row]
      
      let delete = UIContextualAction(style: .destructive, title: "Delete") { (action, view, actionPerformed: @escaping (Bool) -> ()) in
         
         let alert = UIAlertController(title: "Delete Burger", message: "Are you sure to delete \(burger.title)?", preferredStyle: .alert)
         alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action) in
            actionPerformed(false)
         }))
         alert.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: { (action) in
            // perform delete
            BurgerFunctions.deleteBurger(index: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            actionPerformed(true)
         }))
         self.present(alert, animated: true, completion: nil)
      }
      
      delete.image = #imageLiteral(resourceName: "delete")
      delete.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
      
      return UISwipeActionsConfiguration(actions: [delete])
   }
   
   func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      let edit = UIContextualAction(style: .normal, title: "Edit") { (action, view, actionPerform: (Bool) -> ()) in
         self.burgerIndexToEdit = indexPath.row
         self.performSegue(withIdentifier: "toAddBurgerSegue", sender: nil)
         actionPerform(true)
      }
      edit.image = #imageLiteral(resourceName: "edit")
      edit.backgroundColor = UIColor(named: "EditColor")
      
      return UISwipeActionsConfiguration(actions: [edit])
   }
   
}
