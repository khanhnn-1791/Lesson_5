//
//  SectionTableViewController.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/19/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit

class SectionTableViewController: UITableViewController {
    
    //MARK: Properties
    let section = ["pizza", "dish", "special"]
    
    let items = [["Pork", "Chicken", "Meat"], ["Sausage", "Meat", "Veggie"], ["Sausage", "Chicken pesto", "Prawns", "Mushrooms"]]

    let wordDict = [String:[String]]()
    //MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return self.section[section]
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return section.count
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items[section].count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        
        cell.nameLabel.text = items[indexPath.section][indexPath.row]
        return cell
    }
    override func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return section.sorted()
    }
    func generateWordDict() {
    }
}
