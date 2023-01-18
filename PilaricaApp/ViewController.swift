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
        let nextVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

