//
//  ShoppingDetailViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 12/12/22.
//

import UIKit

class ShoppingDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var ajiacoList: [AjiacoList] = [
        AjiacoList(itemName: "Pechuga", itemAmount: 2, itemUn: "Un", isSelected: false),
        AjiacoList(itemName: "Papa pastusa", itemAmount: 0.5, itemUn: "Lb", isSelected: false),
        AjiacoList(itemName: "Papa criolla", itemAmount: 3, itemUn: "Lb", isSelected: false),
        AjiacoList(itemName: "Guascas", itemAmount: 1, itemUn: "Un", isSelected: false),
        AjiacoList(itemName: "Aracacha", itemAmount: 1, itemUn: "Lb", isSelected: false),
        AjiacoList(itemName: "Alcaparras", itemAmount: 1, itemUn: "Paquete", isSelected: false),
        AjiacoList(itemName: "Zanahoria", itemAmount: 1, itemUn: "Lb", isSelected: false),
        AjiacoList(itemName: "Crema de leche", itemAmount: 1, itemUn: "Paquete", isSelected: false)
    ]
    
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var itemListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemListTableView.dataSource = self
        itemListTableView.delegate = self
        
        let shoppingDetailViewCell = UINib(nibName: "ShoppingDetailTableViewCell", bundle: nil)
        itemListTableView.register(shoppingDetailViewCell, forCellReuseIdentifier: "ShoppingViewCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "AddItem",
            style: .plain,
            target: self,
            action: #selector(addItemTapped)
        )
    }
    
    @objc func addItemTapped(){
        let nextVC = AddItemViewController(nibName: "AddItemViewController", bundle: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ajiacoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDetail: ShoppingDetailTableViewCell = itemListTableView.dequeueReusableCell(withIdentifier: "ShoppingViewCell", for: indexPath) as! ShoppingDetailTableViewCell
        let itemDetailList: AjiacoList = ajiacoList[indexPath.row]
        cellDetail.cellConfiguration(ajiacoList: itemDetailList)
        cellDetail.delegate = self
        cellDetail.row = indexPath.row
        return cellDetail
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
            self.ajiacoList.remove(at: indexPath.row)
            self.itemListTableView.reloadData()
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}

extension ShoppingDetailViewController: ShoppingDetailTableCellDelegate {
    
    func toggleRow(row: Int) {
        self.ajiacoList[row].isSelected = !self.ajiacoList[row].isSelected
        self.itemListTableView.reloadData()
    }
}

protocol ShoppingDetailTableCellDelegate {
    func toggleRow(row: Int)
}
