//
//  ViewController.swift
//  ComprasUSA
//
//  Created by Anderson Alencar on 20/06/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import UIKit

class ShoppingViewController: UIViewController {

    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var lbRealDescription: UILabel!
    @IBOutlet weak var lbReal: UILabel!
    
    var taxes = TaxesCalculator.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tfDolar.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.tfDolar.resignFirstResponder()
        setAmmount()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAmmount()
    }
    
    func setAmmount() {
        self.taxes.shoppingValue = self.taxes.convertTodouble(self.tfDolar.text!)
        let dolar = self.taxes.getFomattedValue(of: self.taxes.dolar, withCurrency: "")
        self.lbReal.text = self.taxes.getFomattedValue(of: self.taxes.shoppingValueReal, withCurrency: "R$ ")
        self.lbRealDescription.text = "Valor sem impostos (dólar \(dolar))"
    }
    
    


}

extension ShoppingViewController: UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        setAmmount()
        self.tfDolar.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        setAmmount()
        self.tfDolar.resignFirstResponder()
    }
}

