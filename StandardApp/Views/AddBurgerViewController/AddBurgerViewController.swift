//
//  AddBurgerViewController.swift
//  StandardApp
//
//  Created by 정건휘 on 27/03/2019.
//  Copyright © 2019 gunw. All rights reserved.
//

import UIKit
import Photos

class AddBurgerViewController: UIViewController {
   
   // MARK: - Properties
   @IBOutlet weak var titleLabel: UILabel!
   @IBOutlet weak var burgerTextField: UITextField!
   @IBOutlet weak var cancelButton: UIButton!
   @IBOutlet weak var saveButton: UIButton!
   @IBOutlet weak var imageView: UIImageView!
   
   var doneSaving: (() -> ())?
   
   // MARK: - Life cycle
   override func viewDidLoad() {
      super.viewDidLoad()
      imageView.layer.cornerRadius = 10
      titleLabel.font = UIFont(name: Theme.mainFontName, size: 26)
      
      // Dropshadow on title
      titleLabel.layer.shadowOpacity = 1
      titleLabel.layer.shadowColor = UIColor.white.cgColor
      titleLabel.layer.shadowOffset = CGSize.zero
      titleLabel.layer.shadowRadius = 5
   }
   
   // MARK: - Methods
   @IBAction func cancel(_ sender: Any) {
      dismiss(animated: true, completion: nil)
   }
   
   @IBAction func save(_ sender: Any) {
      burgerTextField.rightViewMode = .never
      guard burgerTextField.text != "", let newBurgerName = burgerTextField.text else {
         let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
         imageView.image = UIImage(named: "warning")
         imageView.contentMode = .scaleAspectFit
         
         burgerTextField.rightView = imageView
         burgerTextField.rightViewMode = .unlessEditing
         burgerTextField.layer.borderColor = UIColor.red.cgColor
         burgerTextField.layer.borderWidth = 1
         burgerTextField.layer.cornerRadius = 5
         burgerTextField.placeholder = "Burger name required"
         return
      }
      
      BurgerFunctions.createBurger(burgerModel: BurgerModel(title: newBurgerName, image: imageView.image))
      if let doneSaving = doneSaving {
         doneSaving()
      }
      dismiss(animated: true, completion: nil)
   }
   
   // 카메라 버튼 클릭 동작 - 이미지 피커 컨트롤
   fileprivate func presentPhotoPickerController() {
      let myPickerController = UIImagePickerController()
      myPickerController.sourceType = .photoLibrary
      myPickerController.delegate = self
      self.present(myPickerController, animated: true, completion: nil)
   }
   
   @IBAction func addPhoto(_ sender: Any) {
      if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
         PHPhotoLibrary.requestAuthorization { (status) in
            switch status {
            case .authorized:
               self.presentPhotoPickerController()
            case .notDetermined:
               if status == PHAuthorizationStatus.authorized {
                  self.presentPhotoPickerController()
               }
            case .restricted:
               let alert = UIAlertController(title: "Photo Library Restricted", message: "Photo Library access is restricted and cannot be accessed.", preferredStyle: .alert)
               let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
               alert.addAction(okAction)
               self.present(alert, animated: true, completion: nil)
            case .denied:
               let alert = UIAlertController(title: "Photo Library Denied", message: "Photo Library access was previously denied. Pleas update your settings if you wish to change this.", preferredStyle: .alert)
               let gotoSettingsAction = UIAlertAction(title: "Go to Settings", style: .default) { (action) in
                  DispatchQueue.main.async {
                     guard let url = URL(string: UIApplication.openSettingsURLString) else { return }
                     UIApplication.shared.open(url, options: [:], completionHandler: nil)
                  }
               }
               let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
               alert.addAction(gotoSettingsAction)
               alert.addAction(cancelAction)
               self.present(alert, animated: true, completion: nil)
            
            }
         }
      }
   }
}

extension AddBurgerViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
   func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
         self.imageView.image = image
      }
      dismiss(animated: true, completion: nil)
   }
   
   func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
      dismiss(animated: true, completion: nil)
   }
}
