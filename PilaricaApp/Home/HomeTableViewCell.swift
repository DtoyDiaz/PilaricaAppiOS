//
//  HomeTableViewCell.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 6/12/22.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    var delegate: HomeTableCellDelegate?
    var row: Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellConfiguration(exampleList: ShoppingList){
        listNameLabel.text = exampleList.name
        
        if exampleList.isSelected {
            let image = UIImage(systemName: "checkmark.square")
            checkButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(systemName: "square")
            checkButton.setImage(image, for: .normal)
        }
    }
    
    @IBAction func checkButtonDidClic(_ sender: Any) {
        delegate?.toggleRow(row: row)
    }
}
