//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Melissa Elliston-Boyes on 13/12/2024.
//  Copyright © 2024 London App Brewery. All rights reserved.
//

import UIKit

struct CalculatorLogic {
    
    private var number: Double?
    
    private var intermediateCalculation: (n1: Double, calcmethod: String)?
    
    mutating func setNumber(_ number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculation(n2: n)
            default:
                intermediateCalculation = (n1: n, calcmethod: symbol)
            }
        }
        return nil
    }
    
    private func performTwoNumCalculation(n2: Double)-> Double? {
        if let n1 = intermediateCalculation?.n1,
           let operation = intermediateCalculation?.calcmethod {
            
            switch operation {
            case "+":
                return n1 + n2
            case "-":
                return n1 - n2
            case "×":
                return n1 * n2
            case "÷":
                return n1 / n2
            default:
                fatalError("The operation passed in does not match any of the cases: \(operation)")
            }
        }
        return nil
    }
}
