//
//  Constants.swift
//  Travel
//
//  Created by Rio Ho on 18/10/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import Foundation

public struct Constant {
    
    // MARK: - View Navigation
    public struct SegueIdentifier {
        public static let welcome = "WelcomeVC"
        public static let swapper = "showSwapper"
        public static let countries = "showCountries"
        public static let favorites = "showFavorites"
        public static let countryDetails = "showCountryDetails"
    }
    
    // MARK: - Table View Cell
    public struct CellIdentifier {
        public static let country = "countryCell"
        public static let favorite = "favoriteCell"
    }
    
}
