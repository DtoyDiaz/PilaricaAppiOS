//
//  TempShoppingDetailViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 18/12/22.
//

import UIKit

class TempShoppingDetailViewController: UIViewController {

    // MARK: - IBOutlets - Conecto los Outlets del Storyboard.
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var UnLabel: UILabel!
    @IBOutlet weak var seasonLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    // MARK: - Internal Properties - Esto lo hice con el fin de usar la variable para acceder a las propiedades
    var avocato: Avocato? = nil
    
    // MARK: - Lifecycle - Todo lo que quiero que suceda cuando corro la app, se llama en este momento.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = avocato?.itemName  // Desde accedo a cada valor
        UnLabel.text = avocato?.itemUn
        seasonLabel.text = avocato?.itemSeason
        ownerLabel.text = avocato?.itemOwner
        dateLabel.text = avocato?.itemDate
//      priceLabel.text = String(avocato?.itemPrice)
//      amountLabel.text = String(avocato?.itemAmount) ?? nil
    }
}
