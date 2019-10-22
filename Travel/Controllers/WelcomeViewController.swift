//
//  HomeViewController.swift
//  Travel
//
//  Created by Rio Ho on 26/8/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import Firebase
import FirebaseAuth
import Spruce
import UIKit

class WelcomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var welcomLabel: UILabel!
    @IBOutlet weak var countriesButton: UIButton!
    @IBOutlet weak var ticketsButton: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    
    let backgroundImageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackground()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        let sortFunction = LinearSortFunction(direction: .topToBottom, interObjectDelay: 0.5)
        self.mainView.spruce.animate([.fadeIn, .expand(.severely)], sortFunction: sortFunction)
    }
    
    func setBackground() {
        self.view.addSubview(self.backgroundImageView)
        self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        self.backgroundImageView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.backgroundImageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.backgroundImageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.backgroundImageView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.backgroundImageView.image = UIImage(named: "Welcome Wallpaper")
        self.backgroundImageView.contentMode = UIView.ContentMode.scaleToFill
        self.view.sendSubviewToBack(self.backgroundImageView)
    }
    
    // MARK: - IB Actions
    @IBAction func LogoutButtonTapped(_ sender: Any) {
        do {
            try Auth.auth().signOut()
//            self.performSegue(withIdentifier: "LoginScreen", sender: nil)
            self.dismiss(animated: true, completion: nil)
        } catch {
            print(error)
        }
    }

}

