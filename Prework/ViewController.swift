//
//  ViewController.swift
//  Prework
//
//  Created by Jay on 1/13/22.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var sliderTipPercentage: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var splitTipLabel: UILabel!
    @IBOutlet weak var splitTipSlider: UISlider!
    @IBOutlet weak var splitBetweenLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tipSliderUpdater(_ sender: Any) {
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercent = Int(tipSlider.value)
        let tip = bill * (Double(tipPercent) / 100)
        let total = bill + tip
        
        let people = Int(splitTipSlider.value)
        let splitTipAmount = tip / Double(people)
        splitTipLabel.text = String(format: "$%.2f", splitTipAmount)
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)

        sliderTipPercentage.text = String(format: "%d%%", tipPercent)
    }
    
    
    @IBAction func calculateSplitTip(_ sender: Any) {
        let people = Int(splitTipSlider.value)
        let bill = Double(billAmountTextField.text!) ?? 0
        let tipPercent = Int(tipSlider.value)
        let tip = bill * (Double(tipPercent) / 100)
        let splitTipAmount = tip / Double(people)
        splitTipLabel.text = String(format: "$%.2f", splitTipAmount)
        splitBetweenLabel.text = String("\(people)")
    }
    
    
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get selected tip percentage and calculate total tip
        let tipPercentages  = [0.15, 0.18, 0.20]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        let people = Int(splitTipSlider.value)
        let splitTipAmount = tip / Double(people)
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        splitTipLabel.text = String(format: "$%.2f", splitTipAmount)
    }
    
}

