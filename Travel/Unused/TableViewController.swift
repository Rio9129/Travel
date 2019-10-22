//
//  TableTableViewController.swift
//  Travel
//
//  Created by Rio Ho on 8/9/19.
//  Copyright © 2019 Ruiivan Ho. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
        func someMethodIWantToCall(cell: CountryCell) { // Specific cell :)
        //print("Inside of ViewController now...")
        
        // we're going to figure out which name we're clicking on
        
        guard let indexPathTapped = tableView.indexPath(for: cell) else { return }
        //print(indexPathTapped)
        
        guard let country = self.getCountry(from: indexPathTapped) else {
            print("Error: Can't get selected country!")
            return
        }
        
        // Update hasFavourite
        country.hasFavourite = !country.hasFavourite
        
        // Here's the country :)
        print("Country: \(country.name)")
        print("Has Favourite: \(country.hasFavourite)")
        
        // Update color of heartButton
        cell.heartButton.tintColor = country.hasFavourite ? .red : .lightGray
    }
    
    let countrys = [
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
        
    let countryIndexTitles = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    

    var countrysDict = [String: [Country]]()
    var countrySectionTitles = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
         //navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show IndexPath", style: .plain, target: self, action: #selector(handleShowIndexPath))
               
               navigationItem.title = "Country"
               navigationController?.navigationBar.prefersLargeTitles = true
               
               tableView.register(CountryCell.self, forCellReuseIdentifier: "Cell")
        
        // Generate the avenger dictionary
        createCountryDict()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        //Get Key of CountryDict
//        let countryKey = countrySectionTitles[indexpath]
//
//        //Get associated value of key from countryDict
//        guard let countries = countryDict[countryKey]as?[String] else
//        { return }
        
        // No need to implement didSelectRowAt delegate since you want to get the name as
        // user clicks the heart button.
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return countrySectionTitles.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return countrySectionTitles[section]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Return the number of rows in the section
        let countryKey = countrySectionTitles[section]
        guard let countryValues = countrysDict[countryKey] else { return 0 }
        
        return countryValues.count
    }
    
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return countryIndexTitles
    }
    
    override func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        
        guard let index = countrySectionTitles.firstIndex(of: title) else { return -1 }
        
        return index
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 36
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        let headerView = view as! UITableViewHeaderFooterView
        headerView.backgroundView?.backgroundColor = UIColor(red: 236.0/255.0, green: 240.0/255.0, blue: 241.0/255.0, alpha: 1)
        headerView.textLabel?.textColor = .red
        
        headerView.textLabel?.font = UIFont(name: "Arial", size: 20.0)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CountryCell
//        cell.link = self
//
//        // Configure the cell...
//        let countryKey = countrySectionTitles[indexPath.section]
//        if let countryValues = countrysDict[countryKey] {
//            cell.textLabel?.text = countryValues[indexPath.row]
//
//
//            cell.imageView?.image = UIImage(named: countryValues[indexPath.row])
//            cell.imageView?.layer.cornerRadius = 60 / 2
//            cell.imageView?.layer.masksToBounds = true
//        }
//
//
//
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CountryCell
        let countryKey = countrySectionTitles[indexPath.section]
        guard let countryValues = countrysDict[countryKey] else { return cell }
        let country = countryValues[indexPath.row]
        
        cell.textLabel?.text = country.name
        cell.imageView?.image = UIImage(named: country.name)
        cell.imageView?.layer.cornerRadius = 60.0 / 2.0
        cell.imageView?.layer.masksToBounds = true
        
        cell.link = self
        cell.heartButton.tintColor = country.hasFavourite ? .red : .lightGray // Just added :)
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Helper method
    
    func createCountryDict() {
        for country in countrys {
//            // Get the first letter of the avenger name and build the dictionary
//            let firstLetterIndex = country.index(country.startIndex, offsetBy: 1)
//            let countryKey = String(country[..<firstLetterIndex])
//
//            if var countryValues = countrysDict[countryKey] {
//                countryValues.append(country)
//                countrysDict[countryKey] = countryValues
//            } else {
//                countrysDict[countryKey] = [country]
//            }
            
            // Get the first letter of the avenger name and build the dictionary
            let firstLetterIndex = country.name.index(country.name.startIndex, offsetBy: 1)
            let countryKey = String(country.name[..<firstLetterIndex])
            
            if var countryValues = countrysDict[countryKey] {
                countryValues.append(country)
                countrysDict[countryKey] = countryValues
            } else {
                countrysDict[countryKey] = [country]
            }
        }
        
        // Get the section titles from the dictionary's keys and sort them in ascending order
        countrySectionTitles = [String](countrysDict.keys)
        countrySectionTitles = countrySectionTitles.sorted(by: { $0 < $1
        })
    }
    
    //@objc func handleShowIndexPath() {
    
    // MARK: - Utility Method
    
    private func getCountry(from indexPath: IndexPath) -> Country? {
        let countryKey = countrySectionTitles[indexPath.section]
        guard let countries = countrysDict[countryKey] else { return nil }
        return countries[indexPath.row]
    }
        
}



