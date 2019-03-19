//
//  ViewController.swift
//  TableViewTest
//
//  Created by nguyen.nam.khanh on 3/18/19.
//  Copyright © 2019 nguyen.nam.khanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func startAction(_ sender: Any) {
        guard let controller = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TableViewController") as? TableViewController else {
            return
        }
        
        present(controller, animated: true, completion: nil)
    }
    
}

