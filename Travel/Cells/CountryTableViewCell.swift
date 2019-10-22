//
//  CountryTableViewCell.swift
//  Travel
//
//  Created by Rio Ho on 18/10/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit

// MARK: - Protocol
public protocol CountryTableViewCellDelegate: class {
    func didTapHeartButton(fromCell cell: CountryTableViewCell)
}

public final class CountryTableViewCell: UITableViewCell {
    
    // MARK: - Delegate
    public weak var delegate: CountryTableViewCellDelegate?
    
    // MARK: - Stored Properties
    public var heartButton: UIButton!

    // MARK: - Overrides
    public override func prepareForReuse() {
        super.prepareForReuse()
        self.delegate = nil
    }
    
    // MARK: - Initializations
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.heartButton = UIButton(type: UIButton.ButtonType.system)
        self.heartButton.setImage(#imageLiteral(resourceName: "fav_heart"), for: UIControl.State.normal)
        self.heartButton.frame = CGRect(x: 0, y: 0, width: 50.0, height: 50.0)
        self.heartButton.tintColor = UIColor.lightGray
        self.heartButton.addTarget(
            self,
            action: #selector(CountryTableViewCell.didTapHeartButton(_:)),
            for: UIControl.Event.touchUpInside
        )
        self.accessoryView = self.heartButton
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

// MARK: - Target Action Methods
extension CountryTableViewCell {
    
    @objc private func didTapHeartButton(_ sender: UIButton) {
        guard let delegate = self.delegate else {
            print("Error: Delegate is nil!")
            return
        }
        delegate.didTapHeartButton(fromCell: self)
    }

}

