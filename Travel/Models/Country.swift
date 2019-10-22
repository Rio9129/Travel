//
//  Country.swift
//  Travel
//
//  Created by Julius Abarra on 17/10/2019.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import Foundation

public final class Country {
    
    // MARK: - Stored Properties
    public var name: String
    public var hasFavourite: Bool
    
    // MARk: - Initializer
    public init(name: String, hasFavourite: Bool) {
        self.name = name
        self.hasFavourite = hasFavourite
    }
    
}
