//
//  TableViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 6/12/22.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    let exampleList: [ShoppingList] = [
        ShoppingList(name: "Asado fin de año"),
        ShoppingList(name: "Fiesta despedida empresa"),
        ShoppingList(name: "Regalos navidad"),
        ShoppingList(name: "Regalos fundación"),
        ShoppingList(name: "Ingredientes ajiaco"),
        ShoppingList(name: "Materiales para el baño")
    ]
    
    @IBOutlet var pilaricaListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pilaricaListTable.dataSource = self
        pilaricaListTable.delegate = self
        
        let homeTableViewCell = UINib(nibName: "HomeTableViewCell", bundle: nil)
        pilaricaListTable.register(homeTableViewCell, forCellReuseIdentifier: "HomeTableViewCell")
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = pilaricaListTable.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let elementList: ShoppingList = exampleList[indexPath.row]
        cell.cellConfiguration(exampleList: elementList)
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return exampleList.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let nextVC = ShoppingDetailViewController(nibName: "ShoppingDetailViewController", bundle: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let checkAction = UIContextualAction(style: .destructive, title: "check") { (action, view, handler) in
                    print("Check Action Tapped")
                }
                checkAction.backgroundColor = .green
                let configuration = UISwipeActionsConfiguration(actions: [checkAction])
                return configuration
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, handler) in
                    print("Delete Action Tapped")
                }
                deleteAction.backgroundColor = .red
                let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
                return configuration
    }
    
}
