//
//  SettingsViewController.swift
//  ComprasUSA
//
//  Created by Anderson Alencar on 20/06/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var tfDolar: UITextField!
    @IBOutlet weak var tfIOF: UITextField!
    @IBOutlet weak var tfStatesTaxes: UITextField!
    
    var taxes = TaxesCalculator.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tfDolar.delegate = self
        self.tfIOF.delegate  = self
        self.tfStatesTaxes.delegate = self
        self.tfDolar.text = self.taxes.getFomattedValue(of: self.taxes.dolar, withCurrency: "")
        self.tfIOF.text = self.taxes.getFomattedValue(of: self.taxes.iof, withCurrency: "")
        self.tfStatesTaxes.text = self.taxes.getFomattedValue(of: self.taxes.stateTax, withCurrency: "")
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.upgradeClassValue()
        view.endEditing(true)
    }
    
    
    func upgradeClassValue() {
        self.taxes.dolar = Double(self.tfDolar.text!)!
        self.taxes.iof = Double(self.tfIOF.text!)!
        self.taxes.stateTax = Double(self.tfStatesTaxes.text!)!
    }
    

}

extension SettingsViewController: UITextFieldDelegate{
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.upgradeClassValue()
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.upgradeClassValue()
        textField.resignFirstResponder()
    }
}
