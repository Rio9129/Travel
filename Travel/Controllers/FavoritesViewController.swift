//
//  FavoritesViewController.swift
//  Travel
//
//  Created by Rio Ho on 18/10/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit

public final class FavoritesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Stored Properties
    public var countryList: [Country] = [Country]()
    private var countryListDictionary: [String: [Country]] = [String: [Country]]()
    private var sectionTitles: [String] = [String]()
    
    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register cell
        self.tableView.register(
            FavoriteTableViewCell.self,
            forCellReuseIdentifier: Constant.CellIdentifier.favorite
        )
        
        // Configure table
        self.configureDataSource()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.reloadData()
    }
    
}

// MARK: - Utility Methods
extension FavoritesViewController {
    
    private func configureDataSource() {
        self.countryList.forEach { country in
            let firstLetterIndex = country.name.index(country.name.startIndex, offsetBy: 1)
            let key = String(country.name[..<firstLetterIndex]).uppercased()
            
            if var countries = self.countryListDictionary[key] {
                countries.append(country)
                self.countryListDictionary[key] = countries
            }
            else {
                self.countryListDictionary[key] = [country]
            }
        }
        
        self.sectionTitles = [String](self.countryListDictionary.keys)
        self.sectionTitles = self.sectionTitles.sorted(by: { $0 < $1 })
    }
    
}

// MARK: - UITableViewDataSource Methods
extension FavoritesViewController: UITableViewDataSource {
    
    public func numberOfSections(
        in tableView: UITableView
    ) -> Int {
        return self.sectionTitles.count
    }
    
    public func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int
    ) -> String? {
        return self.sectionTitles[section]
    }
    
    public func sectionIndexTitles(
        for tableView: UITableView
    ) -> [String]? {
        return self.sectionTitles
    }
    
    public func tableView(
        _ tableView: UITableView,
        sectionForSectionIndexTitle title: String,
        at index: Int
    ) -> Int {
        guard let index = self.sectionTitles.firstIndex(of: title) else { return -1 }
        return index
    }
    
    
    public func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        let key = self.sectionTitles[section]
        guard let countries = self.countryListDictionary[key] else { return 0 }
        return countries.count
    }
    
    public func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(
                withIdentifier: Constant.CellIdentifier.favorite
                ) as? FavoriteTableViewCell
        else {
            return UITableViewCell()
        }
        
        let key = self.sectionTitles[indexPath.section]
        guard let countries = self.countryListDictionary[key] else { return cell }
        let country: Country = countries[indexPath.row]
        cell.textLabel?.text = country.name
        cell.imageView?.image = UIImage(named: country.name)
        cell.imageView?.layer.cornerRadius = 60.0 / 2.0
        cell.imageView?.layer.masksToBounds = true
        return cell
    }
    
}

// MARK: - UITableViewDelegate Methods
extension FavoritesViewController: UITableViewDelegate {
    
    public func tableView(
        _ tableView: UITableView,
        willDisplayHeaderView view: UIView,
        forSection section: Int
    ) {
        let headerView = view as! UITableViewHeaderFooterView
        let view: UIView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 50.0))
        view.backgroundColor = UIColor.orange
        headerView.backgroundView = view
        headerView.textLabel?.textColor = UIColor.white
        headerView.textLabel?.font = UIFont(name: "Arial", size: 20.0)
    }
    
    public func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int
    ) -> CGFloat {
        return 36
    }

}
