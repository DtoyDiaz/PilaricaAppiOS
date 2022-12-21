//
//  ShoppingDetailTableViewCell.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 13/12/22.
//

import UIKit

class ShoppingDetailTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlets -
    @IBOutlet weak var checkBox: UISwitch!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var unLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
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
    }
}
