  //
//  ViewController.swift
//  TschenrechnerNeu
//
//  Created by Mario Mohar on 15.01.21.
//

import UIKit

class ViewController: UIViewController {
    
    ///ErgebnissAnzeige
    @IBOutlet weak var ResultLabel: UILabel!
    
    var userIsInTheMiddleOfTipping : Bool = false // 1. true (Stimmt) 2. false (stimmt nicht)
    var decimalusing : Bool = false
    
    var firstNumber : Double = 0.0
    var secondNumber : Double = 0.0
    var result : Double = 0.0
    var choosingOperator : String = ""
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func NumberButton_Tapped(_ sender: Round) {
        var key = sender.currentTitle!
        
        if key == "," {
            key = "."
        }
        
        if userIsInTheMiddleOfTipping == true {
            
            if decimalusing == true && key == "." {
                key = ""
            }
            
            ResultLabel.text = ResultLabel.text! + key
        } else {
            ResultLabel.text = key
            userIsInTheMiddleOfTipping = true
        }
        
        if key == "." {
            decimalusing = true
        }
    }
    
    @IBAction func EqualButton_Tapped(_ sender: Round) {
        secondNumber = Double(ResultLabel.text!)!
        
        calculate(_operator: choosingOperator)
        
        ResultLabel.text = String(format: "%.2f" , result)
        
        userIsInTheMiddleOfTipping = false
        decimalusing = false
    }
    
    @IBAction func ClearButton_Tapped(_ sender: Round) {
        firstNumber = 0
        secondNumber = 0
        result = 0
        choosingOperator = ""
        ResultLabel.text = "0"
        decimalusing = false
    }
    
    @IBAction func OperationsButton_Tapped(_ sender: Round) {
        if ResultLabel.text! != "." {
            firstNumber = Double(ResultLabel.text!)!
            
            userIsInTheMiddleOfTipping = false
            choosingOperator = sender.currentTitle!
            
            decimalusing = false
        }
        
        
    }
    
    func calculate(_operator: String) {
        switch _operator {
        case "+": result = firstNumber + secondNumber
        case "-": result = firstNumber - secondNumber
        case "x": result = firstNumber * secondNumber
        case "÷": result = firstNumber / secondNumber
        default:
            break
        }
    }
    
    
    
    

}

