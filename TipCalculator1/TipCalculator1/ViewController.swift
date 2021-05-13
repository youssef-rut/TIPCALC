//
//  ViewController.swift
//  TipCalculator1
//
//  Created by Hossam Elshewikh on 5/13/21.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var tenPercent: UILabel!
    @IBOutlet weak var fifteenPercent: UILabel!
    @IBOutlet weak var twentyPercent: UILabel!
    
    @IBOutlet weak var billTextField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billTextField.delegate = self
    }

    
    @IBAction func caclulateTipButtonPressed(_ sender: Any) {
        print("Calculate Tip")
        hideKeyboard()
        calculateAllTips()
    }
    
    func hideKeyboard() {
        billTextField.resignFirstResponder()
    }
    
    
    func calculateAllTips() {
        guard let subtotal = convertCurrencyToDouble(input: billTextField.text!) else {
            print("Not a number!: \(billTextField.text!)")
            return
        }
        print("The subtotal is: \(subtotal)")
        
        // Calculate the tips
        let tip1 = calculateTip(subtotal: subtotal, tipPercentage: 10.0)
        let tip2 = calculateTip(subtotal: subtotal, tipPercentage: 15.0)
        let tip3 = calculateTip(subtotal: subtotal, tipPercentage: 20.0)
        
        // Update the UI
        tenPercent.text = convertDoubleToCurrency(amount: tip1)
        fifteenPercent.text = convertDoubleToCurrency(amount: tip2)
        twentyPercent.text = convertDoubleToCurrency(amount: tip3)
    }
    
    func calculateTip(subtotal: Double, tipPercentage: Double) -> Double {
        return subtotal * (tipPercentage / 100.0) + subtotal
    }
    
    
    func convertCurrencyToDouble(input: String) -> Double? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.number(from: input)?.doubleValue
    }
    
    func convertDoubleToCurrency(amount: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale.current
        
        return numberFormatter.string(from: NSNumber(value: amount))!
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("Return pressed")
        calculateAllTips()
        hideKeyboard()
        return true
    }

}

