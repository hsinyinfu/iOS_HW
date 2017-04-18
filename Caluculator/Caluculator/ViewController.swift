//
//  ViewController.swift
//  Caluculator
//
//  Created by 傅信穎 on 2017/4/1.
//  Copyright © 2017年 傅信穎. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentNum = "0" {
        didSet{
            self.displayLabel.text = self.currentNum
        }
    }
    var result  =  0.0
    var operand  =  0.0
    var myOperator  =  0
    var labelCanBeFlushed = false
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func numBtnClicked(_ sender: UIButton) {
        let numBtnDigit = sender.tag - 1000
        let btnText = "\(numBtnDigit)"
        let curText = self.displayLabel.text ?? "0"
        if curText[ curText.startIndex ] == "-" {
            self.displayLabel.text = curText.substring(from: curText.index(after: curText.startIndex))
        }
        if labelCanBeFlushed {
            self.displayLabel.text = btnText
            labelCanBeFlushed = false
        } else {
            if curText == "0" || curText == "-0" {
                self.displayLabel.text = btnText
            } else {
                self.displayLabel.text = self.displayLabel.text! + btnText
            }
            if curText[ curText.startIndex ] == "-" {
                self.displayLabel.text = "-" + self.displayLabel.text!
            }
        }
    }

    
    @IBAction func AC_btnClicked(_ sender: UIButton) {
        self.displayLabel.text = "0"
        self.result = 0.0
        self.operand = 0.0
        self.myOperator = 0
        self.labelCanBeFlushed = false
    }
    
    @IBAction func pos_negBtnClicked(_ sender: UIButton) {
        var curText = self.displayLabel.text ?? "0"
        if curText[ curText.startIndex ] == "-" {
            curText.remove(at: curText.startIndex)
        } else {
            curText.insert("-", at: curText.startIndex)
        }
        self.displayLabel.text = curText
    }
    
    @IBAction func dotBtnClicked(_ sender: UIButton) {
        var curText = self.displayLabel.text ?? "0"
        guard !curText.contains(".") else {
            return
        }
        curText +=  "."
        self.displayLabel.text = curText
    }
    
    @IBAction func binaryOperatorBtnClicked(_ sender: UIButton) {
        guard !self.labelCanBeFlushed else {
            return
        }
        let curText = self.displayLabel.text ?? "0"
        if myOperator == 0 {
            operand = Double(curText)!
            myOperator = sender.tag
            self.labelCanBeFlushed = true
        } else{
            switch myOperator {
            case 1101: // plus
                self.result = operand + Double(curText)!
            case 1102:  //  minus
                result = operand - Double(curText)!
            case 1103:  //  multiplication
                result = operand * Double(curText)!
            case 1104:  // division
                result = operand / Double(curText)!
//            case 1105:  //  percent
 //               result = operand % Double(currentNum)!
//            case 1106 : // x^y
            default:
                fatalError("Unknown operator button: \(sender)")

            }
            myOperator = sender.tag
            operand = result
            self.displayLabel.text = "\(result)"
            self.labelCanBeFlushed = true
        }
    }

    @IBAction func logBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func expBtnClicked(_ sender: UIButton) {
        self.displayLabel.text = "\(2.718281828459045)"
    }
    
    @IBAction func piBtnClicked(_ sender: UIButton) {
        self.displayLabel.text = "\(Double.pi)"
    }
    
    @IBAction func equalBtnClicked(_ sender: UIButton) {
        guard myOperator != 0 else {
            return
        }
        let curText = self.displayLabel.text ?? "0"
        switch myOperator {
        case 1101: // +
            self.result = operand + Double(curText)!
        case 1102:  //  -
            result = operand - Double(curText)!
        case 1103:  //  *
            result = operand * Double(curText)!
        case 1104:  // /
            result = operand / Double(curText)!
        default:
            fatalError("Unknown operator button: \(sender)")
        }
        myOperator = 0
        self.displayLabel.text = "\(result)"
        self.labelCanBeFlushed = true
    }
    
}

