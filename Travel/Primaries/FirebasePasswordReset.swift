//
//  FirebasePasswordReset.swift
//  Travel
//
//  Created by Rio Ho on 2/9/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase



class FirebasePasswordReset: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var resetPasswordButton: UIButton!
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        // Do any additional setup after loading the view.
        SetUpElements()
    }
    
    func SetUpElements() {
  
    
    //Style the elements
    Utilities.styleTextField(emailTextField)
    Utilities.styleFilledButton(resetPasswordButton)
        
    }
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "Reset Password Wallpaper")
        view.sendSubviewToBack(backgroundImageView)
    }
    
    @IBAction func resetPasswordTapped(_ sender: Any) {
        
        if self.emailTextField.text == "" {
            let alertController = UIAlertController(title: "Oops!", message: "Please enter an email.", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            
        } else {
            Auth.auth().sendPasswordReset(withEmail: self.emailTextField.text!, completion: { (error) in
                
                var title = ""
                var message = ""
                
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else {
                    title = "Success!"
                    message = "Password reset email sent."
                    self.emailTextField.text = ""
                }
                
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            })
        }
        
    }
    
    
  
        
    }
    
    




    









