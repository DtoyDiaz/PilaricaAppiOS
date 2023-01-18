//
//  AddListViewController.swift
//  PilaricaApp
//
//  Created by Daniel Diaz on 26/12/22.
//

import UIKit

class AddListViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var pickerData: [String] = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func pickerButton(_ sender: Any) {
        let vc = UIViewController()
        vc.preferredContentSize = CGSize(width: 250,height: 300)
        let pickerAlert = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 300))
        pickerAlert.delegate = self
        pickerAlert.dataSource = self
        vc.view.addSubview(pickerAlert)
        let editPickerAlert = UIAlertController(title: "Escoja unidad de medida", message: "", preferredStyle: UIAlertController.Style.alert)
        editPickerAlert.setValue(vc, forKey: "contentViewController")
        editPickerAlert.addAction(UIAlertAction(title: "Listo", style: .default, handler: nil))
        editPickerAlert.addAction(UIAlertAction(title: "Cancelar", style: .cancel, handler: nil))
        self.present(editPickerAlert, animated: true)
        
        pickerData = ["Unidad","Paquete", "libra", "kilo", "Cubeta", "Docena"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
}
