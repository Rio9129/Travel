//
//  HomeViewController.swift
//  Travel
//
//  Created by Rio Ho on 1/9/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IB Outlets
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var containerView: UIView!
    
    // MARK: - IB Actions
    @IBAction func closeButtonTapped(_ sender: Any) {
       self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Stored Properties
    private let backgroundImageView = UIImageView()
    private var swapper: PrimaryViewSwapper!
    private var passedCountryList: [Country] = [Country]()
    private var countryList: [Country] = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure background image
        //self.setBackground()
        
        // Assemble country list
        self.configureData()
        
        // Configure target action for segmentedControl
        self.segmentedControl.addTarget(
            self,
            action: #selector(HomeViewController.didToggleSegmentControl(_:)),
            for: UIControl.Event.valueChanged
        )
        
        // Show countr list view by default
        self.showView(withSegueIdentifier: Constant.SegueIdentifier.countries)
    }
}

// MARK: - Utility Methods
extension HomeViewController {
    
    //private func setBackground() {
        //self.view.addSubview(backgroundImageView)
        //self.backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        //self.backgroundImageView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //self.backgroundImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        //self.backgroundImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //self.backgroundImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //self.backgroundImageView.image = UIImage(named: "Home Wallpaper")
        //self.view.sendSubviewToBack(backgroundImageView)
    //}
    
    private func configureData() {
        self.countryList = [
            Country(name: "Hong Kong", hasFavourite: false),
            Country(name: "Bangkok, Thailand", hasFavourite: false),
            Country(name: "London, UK", hasFavourite: false),
            Country(name: "Singapore", hasFavourite: false),
            Country(name: "Bali, Indonesia", hasFavourite: false),
            Country(name: "Dubai, United Arab Emirates", hasFavourite: false),
            Country(name: "Paris, France", hasFavourite: false),
            Country(name: "New York City, US", hasFavourite: false),
            Country(name: "Milan, Italy", hasFavourite: false),
            Country(name: "Vienna, Austria", hasFavourite: false),
            Country(name: "Shenzhen, China", hasFavourite: false),
            Country(name: "Kuala Lumpur, Malaysia", hasFavourite: false),
            Country(name: "Phuket, Thailand", hasFavourite: false),
            Country(name: "Rome, Italy", hasFavourite: false),
            Country(name: "Tokyo, Japan", hasFavourite: false),
            Country(name: "Lisbon, Portugal", hasFavourite: false),
            Country(name: "Istanbul, Turkey", hasFavourite: false),
            Country(name: "Seoul, South Korea", hasFavourite: false),
            Country(name: "Amsterdam, Netherlands", hasFavourite: false),
            Country(name: "Guangzhou, China", hasFavourite: false),
            Country(name: "Prague, Czech Republic", hasFavourite: false),
            Country(name: "Mecca, Saudi Arabia", hasFavourite: false),
            Country(name: "Rio De Janeiro, Brazil", hasFavourite: false),
            Country(name: "Mumbai, India", hasFavourite: false),
            Country(name: "Barcelona, Spain", hasFavourite: false),
            Country(name: "Pattaya, Thailand", hasFavourite: false),
            Country(name: "Shanghai, China", hasFavourite: false),
            Country(name: "Antalya, Turkey", hasFavourite: false),
            Country(name: "Las Vegas, US", hasFavourite: false),
        ]
        
        self.passedCountryList = self.countryList
    }
    
    private func showView(
        withSegueIdentifier identifier: String
    ) {
        DispatchQueue.main.async(execute: {
            self.swapper.swapToViewController(
                withSegueIdentifier: identifier,
                countryList: self.passedCountryList
            )
        })
    }
    
}

// MARK: - Target Action Methods
extension HomeViewController {
    
    @objc private func didToggleSegmentControl(
        _ sender: UISegmentedControl
    ) {
        guard
            let segment = Segment(rawValue: sender.selectedSegmentIndex)
        else {
            print("Error: Segment is nil!")
            return
        }
        
        var identifier = ""
        
        switch segment {
        case .countries:
            self.passedCountryList = self.countryList
            identifier = Constant.SegueIdentifier.countries
        case .favorites:
            self.passedCountryList = self.countryList.filter { $0.hasFavourite == true }
            identifier = Constant.SegueIdentifier.favorites
        }
        
        self.showView(withSegueIdentifier: identifier)
    }
    
    
    
}

// MARK: - Navigation
extension HomeViewController {
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constant.SegueIdentifier.swapper {
            self.swapper = segue.destination as? PrimaryViewSwapper
        }
    }
    
}

 
