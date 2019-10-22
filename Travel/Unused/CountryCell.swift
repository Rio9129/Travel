//
//  CountryCell.swift
//  Travel
//
//  Created by Rio Ho on 22/9/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {
    
    var link: TableViewController?
    var heartButton: UIButton! // To make it accessible outside of this class
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

        heartButton = UIButton(type: .system)
        heartButton.setImage(#imageLiteral(resourceName: "fav_heart"), for: .normal)
        heartButton.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        heartButton.tintColor = .lightGray
        heartButton.addTarget(self, action: #selector(handleMarkAsFavorite), for: .touchUpInside)
        accessoryView = heartButton
    }

    @objc private func handleMarkAsFavorite() {
            //print("Marking as favorite")
            link?.someMethodIWantToCall(cell: self)
    }
    
required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
}
}

