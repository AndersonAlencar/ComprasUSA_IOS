//
//  TaxesViewController.swift
//  ComprasUSA
//
//  Created by Anderson Alencar on 20/06/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import UIKit

class TaxesViewController: UIViewController {

    @IBOutlet weak var lbDolar: UILabel!
    @IBOutlet weak var lbStateTaxDescription: UILabel!
    @IBOutlet weak var lbStateTaxes: UILabel!
    @IBOutlet weak var lbIOFDescription: UILabel!
    @IBOutlet weak var lbIOF: UILabel!
    @IBOutlet weak var swCreditCard: UISwitch!
    @IBOutlet weak var lbTotalReal: UILabel!
    
    var taxes = TaxesCalculator.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lbStateTaxDescription.text = self.taxes.stateTaxDescription
        self.calculateAll()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.lbStateTaxDescription.text = self.taxes.stateTaxDescription
        self.calculateAll()
        
    }
    
    
    
    @IBAction func useCard(_ sender: UISwitch) {
        calculateAll()
    }
    
    
    func calculateAll() {
        
        self.lbDolar.text = self.taxes.getFomattedValue(of: self.taxes.shoppingValue, withCurrency: "US$ ")
        self.lbIOFDescription.text = self.taxes.stateTaxDescription
        self.lbStateTaxes.text = self.taxes.getFomattedValue(of: self.taxes.stateTaxValue, withCurrency: "US$ ")
        self.lbIOFDescription.text = self.taxes.iofDescription
        
        if self.swCreditCard.isOn{
            self.lbIOF.text = self.taxes.getFomattedValue(of: self.taxes.iofValue, withCurrency: "US$ ")
        } else{
            self.lbIOF.text = "US$ 0.00"
        }
        
        self.lbTotalReal.text = self.taxes.getFomattedValue(of: self.taxes.calculate(usingCreditCard: self.swCreditCard.isOn), withCurrency: "R$ ")
        
        
        
        
    }
    

}
