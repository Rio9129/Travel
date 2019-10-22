//
//  ViewController.swift
//  Travel
//
//  Created by Rio Ho on 26/8/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var signUpButton: UIButton!

    @IBOutlet weak var loginButton: UIButton!
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackground()
        
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements() {
        
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    
    @IBAction func unwindToMainScreen(_ sender: UIStoryboardSegue) {
    }
    
    
    
    func setBackground() {
        view.addSubview(backgroundImageView)
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        backgroundImageView.image = UIImage(named: "Wallpaper")
        view.sendSubviewToBack(backgroundImageView)
    }
    
}

