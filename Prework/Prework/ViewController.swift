//
//  ViewController.swift
//  Prework
//
//  Created by Eddie Donovan on 12/21/21.
//

import UIKit
//import XCTest

class ViewController: UIViewController {

    //connects all labels and sliders and text to code
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var billTotalLbl: UILabel!
    @IBOutlet weak var billTxt: UITextField!
    @IBOutlet weak var splitLbl: UILabel!
    @IBOutlet weak var numSplitTxt: UITextField!
    @IBOutlet weak var tipPercLbl: UILabel!
    @IBOutlet weak var tipLbl: UILabel!
    @IBOutlet weak var tiptxt: UILabel!
    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var totaltxt: UILabel!
    @IBOutlet weak var tipSlide: UISlider!
    @IBOutlet weak var tipSlideLbl: UILabel!
    @IBOutlet weak var tipPLbl: UILabel!
    @IBOutlet weak var numSplitLbl: UILabel!
    @IBOutlet weak var totalPLbl: UILabel!
    @IBOutlet weak var totalPtxt: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        super.viewWillAppear(true)
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool){
        let x = UserDefaults.standard.integer(forKey: "currSelectVal")
        switch x{
        case 0:
            billTotalLbl.text = "Bill Total ($):"
            splitLbl.text = "Split Total/Tip ($):"
            tipLbl.text = "Tip ($):"
            totalLbl.text = "Total ($):"
            tipPLbl.text = "Tip/Person ($):"
            totalPLbl.text = "Total/Person ($):"
        case 1:
            billTotalLbl.text = "Bill Total (€):"
            splitLbl.text = "Split Total/Tip (€):"
            tipLbl.text = "Tip (€):"
            totalLbl.text = "Total (€):"
            tipPLbl.text = "Tip/Person (€):"
            totalPLbl.text = "Total/Person (€):"
        case 2:
            billTotalLbl.text = "Bill Total (¥):"
            splitLbl.text = "Split Total/Tip (¥):"
            tipLbl.text = "Tip (¥):"
            totalLbl.text = "Total (¥):"
            tipPLbl.text = "Tip/Person (¥):"
            totalPLbl.text = "Total/Person (¥):"
        case 3:
            billTotalLbl.text = "Bill Total (£):"
            splitLbl.text = "Split Total/Tip (£):"
            tipLbl.text = "Tip (£):"
            totalLbl.text = "Total (£):"
            tipPLbl.text = "Tip/Person (£):"
            totalPLbl.text = "Total/Person (£):"
        case 4:
            billTotalLbl.text = "Bill Total (₣):"
            splitLbl.text = "Split Total/Tip (₣):"
            tipLbl.text = "Tip (₣):"
            totalLbl.text = "Total (₣):"
            tipPLbl.text = "Tip/Person (₣):"
            totalPLbl.text = "Total/Person (₣):"
        case 5:
            billTotalLbl.text = "Bill Total (Can$):"
            splitLbl.text = "Split Total/Tip (Can$):"
            tipLbl.text = "Tip (Can$):"
            totalLbl.text = "Total (Can$):"
            tipPLbl.text = "Tip/Person (Can$):"
            totalPLbl.text = "Total/Person (Can$):"
        case 6:
            billTotalLbl.text = "Bill Total (AU$):"
            splitLbl.text = "Split Total/Tip (AU$):"
            tipLbl.text = "Tip (AU$):"
            totalLbl.text = "Total (AU$):"
            tipPLbl.text = "Tip/Person (AU$):"
            totalPLbl.text = "Total/Person (AU$):"
        default:
            billTotalLbl.text = "Bill Total ($):"
            splitLbl.text = "Split Total/Tip ($):"
            tipLbl.text = "Tip ($):"
            totalLbl.text = "Total ($):"
            tipPLbl.text = "Tip/Person ($):"
            totalPLbl.text = "Total/Person ($):"
        }
        tipSlide.value = Float(UserDefaults.standard.integer(forKey: "defTipVal"))
        tipSlideLbl.text = String("" + String(tipSlide.value) + "%")
        if(UserDefaults.standard.integer(forKey: "DMONOFF") == 1){
            view.backgroundColor = UIColor.black
            titleLbl.textColor = UIColor.white
            billTotalLbl.textColor = UIColor.white
            billTxt.backgroundColor = UIColor.white
            splitLbl.textColor = UIColor.white
            numSplitTxt.backgroundColor = UIColor.white
            tipPercLbl.textColor = UIColor.white
            tipSlideLbl.textColor = UIColor.white
            tipLbl.textColor = UIColor.white
            tiptxt.textColor = UIColor.white
            totalLbl.textColor = UIColor.white
            totaltxt.textColor = UIColor.white
            tipPLbl.textColor = UIColor.white
            numSplitLbl.textColor = UIColor.white
            totalPLbl.textColor = UIColor.white
            totalPtxt.textColor = UIColor.white
        }
         
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        //read bill amount from bill text box
        
        let bill = Float(billTxt.text!) ?? 0
        //logic for tip percentage and total
        var tipPercVal = round(tipSlide.value)
        tipSlideLbl.text = String("" + String(Int(tipPercVal)) + "%") //places the val in the slider as a percent in the label
        /*
        let defTipPerc = UserDefaults.standard.integer(forKey: "defTipVal")
        if (defTipPerc != nil){
            tipPercVal = Float(defTipPerc)
        }
         */
        tipPercVal = tipPercVal / 100 //makes the value a usable percentage
        let tip = tipPercVal * bill
        var numPpl = Float(numSplitTxt.text!) //converts to float so that it can be used by *
        //logic to check if person wants to split the bill or tip
        if (numPpl == nil){
            
            //default value is one person paying
            //hides the split values if not splitting
            numPpl = 1
            numSplitLbl.isHidden = true
            totalPtxt.isHidden = true
            
        } else {
            //unhides the split values if splitting
            numSplitLbl.isHidden = false
            totalPtxt.isHidden = false
            
            //splits the tip percentage based on numPpl
            let splitTip = tip / numPpl!
            numSplitLbl.text = String(format: "$%.2f", splitTip)
        }
        
        //calculates total based on bill and tip
        let total = bill + tip
        
        //calculates total if split certain numPpl ways
        let totalPerP = total / numPpl!
        totalPtxt.text = String(format: "$%.2f", totalPerP)
        
        //set values in labels = to tip and total
        tiptxt.text = String(format: "$%.2f",tip)
        totaltxt.text = String(format: "$%.2f", total)

    }
}

