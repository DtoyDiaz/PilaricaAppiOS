//
//  HomeViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 26/12/22.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var exampleList: [ShoppingList] = [
        ShoppingList(name: "Asado fin de año", isSelected: false),
        ShoppingList(name: "Fiesta despedida empresa", isSelected: false),
        ShoppingList(name: "Regalos navidad", isSelected: false),
        ShoppingList(name: "Regalos fundación", isSelected: false),
        ShoppingList(name: "Ingredientes ajiaco", isSelected: false),
        ShoppingList(name: "Materiales para el baño", isSelected: false),
        ShoppingList(name: "Asado fin de año", isSelected: false),
        ShoppingList(name: "Fiesta despedida empresa", isSelected: false),
        ShoppingList(name: "Regalos navidad", isSelected: false),
        ShoppingList(name: "Regalos fundación", isSelected: false),
        ShoppingList(name: "Ingredientes ajiaco", isSelected: false),
        ShoppingList(name: "Materiales para el baño", isSelected: false)
    ]

    @IBOutlet weak var homeListTable: UITableView!
    var delegate: HomeTableCellDelegate?
    var row: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewDidLoad()
        homeListTable.dataSource = self
        homeListTable.delegate = self
        
        let homeTableViewCell = UINib(nibName: "HomeTableViewCell", bundle: nil)
        homeListTable.register(homeTableViewCell, forCellReuseIdentifier: "HomeTableViewCell")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "AddList",
            style: .plain,
            target: self,
            action: #selector(addListTapped)
        )
    }
    
    @objc func addListTapped(){
        let nextVC = AddListViewController(nibName: "AddListViewController", bundle: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: HomeTableViewCell = homeListTable.dequeueReusableCell(withIdentifier: "HomeTableViewCell", for: indexPath) as! HomeTableViewCell
        let elementList: ShoppingList = exampleList[indexPath.row]
        cell.cellConfiguration(exampleList: elementList)
        cell.delegate = self
        cell.row = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let nextVC = ShoppingDetailViewController(nibName: "ShoppingDetailViewController", bundle: nil)
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete")
        { (action, view, handler) in
            self.exampleList.remove(at: indexPath.row)
            self.homeListTable.reloadData()
        }
        deleteAction.backgroundColor = .red
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
}

extension HomeViewController: HomeTableCellDelegate {
    
    func toggleRow(row: Int) {
        self.exampleList[row].isSelected = !self.exampleList[row].isSelected
        self.homeListTable.reloadData()
    }
}

protocol HomeTableCellDelegate {
    func toggleRow(row: Int)
}
