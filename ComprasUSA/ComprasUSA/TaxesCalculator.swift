//
//  TaxesCalculator.swift
//  ComprasUSA
//
//  Created by Anderson Alencar on 24/06/19.
//  Copyright © 2019 Anderson Alencar. All rights reserved.
//

import Foundation


class TaxesCalculator {
    
    static let shared = TaxesCalculator()
    
    var dolar: Double = 3.5
    var iof: Double = 6.38
    var stateTax: Double = 7.0
    var shoppingValue: Double = 0.0
    let numberFormater = NumberFormatter()
    
    
    
    var shoppingValueReal: Double {
        return self.shoppingValue * self.dolar
    }
    var stateTaxValue: Double {
        return self.shoppingValue * self.stateTax / 100
    }
    
    var iofValue: Double {
        return (self.shoppingValue + self.stateTax) * self.iof/100
    }
    
    var stateTaxDescription: String {
        return "Impostos do estado (\(self.stateTax)%)"
    }
    var iofDescription: String {
        return "IOF(\(self.iof)%)"
    }
    
    func calculate(usingCreditCard: Bool) -> Double {
        
        var finalValue: Double  = (self.shoppingValue * self.dolar) + self.stateTaxValue * self.dolar
        if usingCreditCard{
            finalValue += self.iofValue * self.dolar
        }
        return finalValue
        
    }
    func convertTodouble(_ stringNumber: String) -> Double {
        self.numberFormater.numberStyle = .none
        return self.numberFormater.number(from: stringNumber)!.doubleValue
    }
    
    func getFomattedValue(of value: Double, withCurrency currency: String) -> String {
        
        self.numberFormater.numberStyle = .currency
        self.numberFormater.currencySymbol = currency
        self.numberFormater.alwaysShowsDecimalSeparator = true
        return self.numberFormater.string(for: value)!

    }
    private init(){
        self.numberFormater.usesGroupingSeparator = true
    }
}
