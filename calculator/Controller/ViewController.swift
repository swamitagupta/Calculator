//
//  ViewController.swift
//  calculator
//
//  Created by Swamita on 11/11/20.
//

import UIKit

class ViewController: UIViewController {
    
    let gradientLayer = CAGradientLayer()

    @IBOutlet weak var displayLabel: UILabel!
    
    private var finishedTypingNumber : Bool = true
    
    private var displayValue: Double {
        get {
            guard let number = Double(displayLabel.text!) else {
                fatalError("Cant convert texr to double.")
            }
            return number
        }
        set {
            displayLabel.text = String(newValue)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gradientLayer.frame = self.view.bounds
        gradientLayer.colors = [UIColor.systemIndigo.cgColor, UIColor.black.cgColor]
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        // to insert layer at bottom so that it doesnt hide labels on top
    }

    @IBAction func calcBtnPressed(_ sender: UIButton) {
        finishedTypingNumber = true
        
        if let calcMethod = sender.currentTitle {
            let calculator = CalculatorLogic(number: displayValue)
            guard let result = calculator.calculate(symbol: calcMethod) else {
                fatalError("Calculation result is nil")
            }
            
            displayValue = result
        }
    }
    
    @IBAction func numBtnPressed(_ sender: UIButton) {
        //to avoid crashing if null value found
        if let num = sender.currentTitle{
            if finishedTypingNumber {
                displayLabel.text = num
                finishedTypingNumber = false
            } else {
                if num == "." {
                    
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + num
            }
            
        }
    }
}

