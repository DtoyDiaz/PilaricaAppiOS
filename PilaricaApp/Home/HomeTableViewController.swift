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
        let listSelected: ShoppingList  = exampleList[indexPath.row]
        let nextVC: ShoppingDetailViewController = ShoppingDetailViewController(nibName: "ShoppingDetailViewController", bundle: nil)
        nextVC.listTitleName = listSelected.name
        navigationController?.pushViewController(nextVC, animated: true)
    }
}
