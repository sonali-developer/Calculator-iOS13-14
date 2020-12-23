//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Sonali Patel on 12/22/20.
//  Copyright © 2020 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calculationMethod: String)?
    
    mutating func setNumber(_ number: Double) {
        print(number)
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        
        if var num = number {
            switch symbol {
                case "+/-":
                    num *= -1
                    return number
                case "AC":
                    return 0
                case "%":
                    num /= 100
                    return number
                case "=":
                    return performCalculation(n2: num)
                default:
                    print("Entered Default")
                    intermediateCalculation = (n1: num, calculationMethod: symbol)
                    print(intermediateCalculation)
            }
        }
        print("Returning nil")
        return nil
    }
    
    private func performCalculation(n2: Double) -> Double? {
        if let firstNumber = intermediateCalculation?.n1, let operator1 = intermediateCalculation?.calculationMethod {
            switch operator1 {
            case "+":
                return firstNumber + n2
            case "-":
                return abs(firstNumber - n2)
            case "*":
                return firstNumber * n2
            case "÷":
                return firstNumber / n2
            default:
                fatalError("The operation passed in does not match any of the expected ones")
            }
        }
        return nil
    }
}
