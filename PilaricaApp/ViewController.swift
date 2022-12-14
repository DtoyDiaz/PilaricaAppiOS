//
//  ViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 30/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func deleteButton(_ sender: Any) {
        let nextVC = HomeTableViewController(nibName: "HomeTableViewController", bundle: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

