//
//  ShoppingDetailTableViewCell.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 13/12/22.
//

import UIKit

class ShoppingDetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var unLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var checkButton: UIButton!
    var delegate: ShoppingDetailTableCellDelegate?
    var row: Int = 0
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func cellConfiguration(ajiacoList: AjiacoList){
        itemLabel.text = ajiacoList.itemName
        unLabel.text = ajiacoList.itemUn
        amountLabel.text = String(ajiacoList.itemAmount)
        
        if ajiacoList.isSelected {
            let image = UIImage(systemName: "checkmark.square")
            checkButton.setImage(image, for: .normal)
        } else {
            let image = UIImage(systemName: "square")
            checkButton.setImage(image, for: .normal)
        }
    }
    
    @IBAction func checkButtonDidClick(_ sender: Any) {
        delegate?.toggleRow(row: row)
    }
}
