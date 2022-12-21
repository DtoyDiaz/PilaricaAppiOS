//
//  ShoppingDetailViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 12/12/22.
//

import UIKit

class ShoppingDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let ajiacoList: [AjiacoList] = [
        AjiacoList(itemName: "Pechuga", itemAmount: 2, itemUn: "Un"),
        AjiacoList(itemName: "Papa pastusa", itemAmount: 0.5, itemUn: "Lb"),
        AjiacoList(itemName: "Papa criolla", itemAmount: 3, itemUn: "Lb"),
        AjiacoList(itemName: "Guascas", itemAmount: 1, itemUn: "Un"),
        AjiacoList(itemName: "Aracacha", itemAmount: 1, itemUn: "Lb"),
        AjiacoList(itemName: "Arveja", itemAmount: 0.25, itemUn: "Lb"),
        AjiacoList(itemName: "Alcaparras", itemAmount: 1, itemUn: "Paquete"),
        AjiacoList(itemName: "Zanahoria", itemAmount: 1, itemUn: "Lb"),
        AjiacoList(itemName: "Crema de leche", itemAmount: 1, itemUn: "Paquete")
    ]
    
    // MARK: - Internal Properties -
    var listTitleName: String = ""
    
    // MARK: - IBOutlets -
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var descriptionListTextField: UITextField!
    @IBOutlet weak var itemListTableView: UITableView!
    
    // MARK: - Lifecycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        itemListTableView.dataSource = self
        itemListTableView.delegate = self
        
        let shoppingDetailViewCell = UINib(nibName: "ShoppingDetailTableViewCell", bundle: nil)
        itemListTableView.register(shoppingDetailViewCell, forCellReuseIdentifier: "ShoppingViewCell")
        listNameLabel.text = listTitleName
    }
    
    // MARK: - Private methods -
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ajiacoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDetail: ShoppingDetailTableViewCell = itemListTableView.dequeueReusableCell(withIdentifier: "ShoppingViewCell", for: indexPath) as! ShoppingDetailTableViewCell
        let itemDetailList: AjiacoList = ajiacoList[indexPath.row]
        cellDetail.cellConfiguration(ajiacoList: itemDetailList)
        return cellDetail
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let nextTempVC: TempShoppingDetailViewController = TempShoppingDetailViewController(nibName: "TempShoppingDetailViewController", bundle: nil)
        nextTempVC.avocato = Avocato(itemName: "Aguacate zas", itemAmount: 2, itemUn: "Unidades", itemSeason: "Verano", itemOwner: "FresCampo", itemPrice: 5000, itemDate: "19-12-2022")
        navigationController?.pushViewController(nextTempVC, animated: true)
    }
}
