//
//  ViewController.swift
//  Calculator
//
//  Created by Angela Yu on 10/09/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Failed to convert the text in the display label to Double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculation = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        isFinishedTypingNumber = !isFinishedTypingNumber
        
        if let calcultionMethod = sender.currentTitle {
            calculation.setNumber(displayValue)
            if let result = calculation.calculate(symbol: calcultionMethod) {
                displayValue = result
            }
        }
    
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        if let numTitle = sender.currentTitle {
            if isFinishedTypingNumber {
                displayLabel.text = numTitle
                isFinishedTypingNumber = !isFinishedTypingNumber
            } else {
                
                if numTitle == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text! += numTitle
            }
        }
    
    }

}

