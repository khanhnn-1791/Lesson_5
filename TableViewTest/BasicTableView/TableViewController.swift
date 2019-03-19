//
//  TableViewController.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/18/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    private var landscapesList = [Landscape]()
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 100
        createList()
    }
    
    private func createList(){
        for _ in 0...10 {
            if let image = UIImage(named: "image_costa_rica") {
                let item = Landscape.init(mainImage: image, title: "National Theatre of Costa Rica", content: "The most beautiful country all over the world. The most beautiful country all over the world. The most beautiful country all over the world. The most beautiful country all over the world")
                landscapesList.append(item)
            }
            tableView.reloadData()
        }
    }
    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return landscapesList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let landscape = landscapesList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTestCell", for: indexPath) as! ItemTestCell
        cell.landscape = landscape
        cell.selectionStyle = .none
        return cell
    }

}
