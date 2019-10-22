//
//  LoginViewController.swift
//  Travel
//
//  Created by Rio Ho on 26/8/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        // Do any additional setup after loading the view.
        SetUpElements()
    }
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "Login Wallpaper")
        view.sendSubviewToBack(backgroundImageView)
    }
    func SetUpElements() {
        
        //Hide the error label
        errorLabel.alpha = 0
        
        //Style the elements
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    

    
    @IBAction func loginTapped(_ sender: Any) {
        
        // Validate Text Fields
        
        // Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
               // Couldn't sign in
               self.errorLabel.text = error?.localizedDescription
               self.errorLabel.alpha = 1
           }
            else {
                guard
                let welcomeViewController =
                    self.storyboard?.instantiateViewController(withIdentifier: Constant.SegueIdentifier.welcome) as?
                WelcomeViewController
                    else { return }
                self.view.window?.rootViewController = welcomeViewController
                self.view.window?.makeKeyAndVisible()

           }
            
            guard
                let welcomeViewController = self.storyboard?.instantiateViewController(
                    withIdentifier: Constant.SegueIdentifier.welcome
                    ) as? WelcomeViewController
            else { return }
            self.present(welcomeViewController, animated: true, completion: nil)
        }
    }
    
    @IBAction func unwindToLoginScreen(_ sender: UIStoryboardSegue) {
    }
    
}
        
            

        
            
        
        

    

