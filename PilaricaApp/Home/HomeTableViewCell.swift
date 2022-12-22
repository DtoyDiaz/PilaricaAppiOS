//
//  HomeTableViewCell.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 6/12/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var listNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellConfiguration(exampleList: ShoppingList){
        listNameLabel.text = exampleList.name
    }
    
    
}
