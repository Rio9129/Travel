//
//  CountryDetailsViewController.swift
//  Travel
//
//  Created by Rio Ho on 21/10/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit

public class CountryDetailsViewController: UIViewController {
    
    
    @IBOutlet weak var countyNameLabel: UILabel!
    
    public var country: Country? = nil
    
    //MARK: - View Life Cycle
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        self.countyNameLabel.text = country?.name
    }
}
