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
    
    @IBOutlet weak var displayLabel: UILabel!
    
    @IBAction func numBtnClicked(_ sender: UIButton) {
        let numBtnDigit = sender.tag - 1000
        let btnText = "\(numBtnDigit)"
        var curText : String = ""
        if currentNum[ currentNum.startIndex ] == "-" {
            curText = currentNum.substring(from: currentNum.index(after: currentNum.startIndex))
        } else { curText = currentNum }
        if curText == "0" {
            guard btnText != "0" else {
                return
            }
            curText = btnText
        } else {
            curText += btnText
        }
        if currentNum[ currentNum.startIndex ] == "-" {
            self.currentNum = "-" + curText
        }
        else {
            self.currentNum = curText
        }
    }

    
    @IBAction func AC_btnClicked(_ sender: UIButton) {
        self.currentNum = "0"
    }
    
    @IBAction func pos_negBtnClicked(_ sender: UIButton) {
        if currentNum[ currentNum.startIndex ] == "-" {
            currentNum.remove(at: currentNum.startIndex)
        } else {
            currentNum.insert("-", at: currentNum.startIndex)
        }
    }
    
    @IBAction func dotBtnClicked(_ sender: UIButton) {
        guard !self.currentNum.contains(".") else {
            return
        }
        self.currentNum +=  "."
    }
    
    @IBAction func binaryOperatorBtnClicked(_ sender: UIButton) {
    }

    @IBAction func logBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func expBtnClicked(_ sender: UIButton) {
    }
    
    @IBAction func piBtnClicked(_ sender: UIButton) {
        self.currentNum = "\(Double.pi)"
    }
    
    @IBAction func equalBtnClicked(_ sender: UIButton) {
    }
    
    
    
}

