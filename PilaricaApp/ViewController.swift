//
//  ViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 30/11/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var checkBoxButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func deleteButton(_ sender: Any) {
        let nextVC = HomeViewController(nibName: "HomeViewController", bundle: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func termsConditionsButton(_ sender: Any) {
        let nextVC = HyperlinkViewController(nibName: "HyperlinkViewController", bundle: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func checkBoxConfiguration(){
        if checkBoxButton.isSelected {
            let image = UIImage(systemName: "checkmark.square")
            checkBoxButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(systemName: "square")
            checkBoxButton.setImage(image, for: .normal)
        }
    }
}

