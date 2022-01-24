//
//  SettingsViewController.swift
//  Prework
//
//  Created by Eddie Donovan on 12/26/21.
//

import UIKit
//import XCTest

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var settingsLbl: UILabel!
    @IBOutlet weak var currSelect: UISegmentedControl!
    @IBOutlet weak var defTipPerc: UISlider!
    @IBOutlet weak var defTipPerclbl: UILabel!
    @IBOutlet weak var darkModeSwitch: UISwitch!
    @IBOutlet weak var darkModeSwitchlbl: UILabel!
    @IBOutlet weak var defLbl: UILabel!
    @IBOutlet weak var currDefLbl: UILabel!
    @IBOutlet weak var dmDefLbl: UILabel!
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setDefPage()
        // Do any additional setup after loading the view.
    }
 
    
    func setDefPage(){
        currSelect.selectedSegmentIndex = UserDefaults.standard.integer(forKey: "currSelectVal")
        defTipPerc.value = Float(UserDefaults.standard.integer(forKey: "defTipVal"))
        defTipPerclbl.text = String("" + String(defTipPerc.value) + "%")
        if (UserDefaults.standard.integer(forKey: "DMONOFF") == 1){
            darkModeSwitch.isOn = true
            darkModeSwitchlbl.text = "On"
            view.backgroundColor = UIColor.black
            darkModeSwitchlbl.textColor = UIColor.white
            dmDefLbl.textColor = UIColor.white
            defTipPerclbl.textColor = UIColor.white
            defLbl.textColor = UIColor.white
            currDefLbl.textColor = UIColor.white
            settingsLbl.textColor = UIColor.white
            currSelect.backgroundColor = UIColor.white
        } else {
            darkModeSwitch.isOn = false
            darkModeSwitchlbl.text = "Off"
            view.backgroundColor = UIColor.white
            darkModeSwitchlbl.textColor = UIColor.black
            dmDefLbl.textColor = UIColor.black
            defTipPerclbl.textColor = UIColor.black
            defLbl.textColor = UIColor.black
            currDefLbl.textColor = UIColor.black
            settingsLbl.textColor = UIColor.black
            currSelect.backgroundColor = UIColor.white
        }
    }
    
    @IBAction func currSelectSet(_ sender: Any) {
        let val = currSelect.selectedSegmentIndex
        switch val{
        case 0:
            defaults.set(0, forKey: "currSelectVal")
        case 1:
            defaults.set(1, forKey: "currSelectVal")
        case 2:
            defaults.set(2, forKey: "currSelectVal")
        case 3:
            defaults.set(3, forKey: "currSelectVal")
        case 4:
            defaults.set(4, forKey: "currSelectVal")
        case 5:
            defaults.set(5, forKey: "currSelectVal")
        case 6:
            defaults.set(6, forKey: "currSelectVal")
        default:
            defaults.set(0, forKey: "currSelectVal")
        }
        
    }
    
    @IBAction func defTipPercSet(_ sender: Any) {
        let defTip = round(defTipPerc.value)
        defTipPerclbl.text = String("" + String(Int(defTip)) + "%")
        defaults.set(Int(defTip), forKey: "defTipVal")
        
    }
    
    @IBAction func darkMode(_ sender: Any) {
        if(darkModeSwitch.isOn){
            darkModeSwitchlbl.text = "On"
            view.backgroundColor = UIColor.black
            darkModeSwitchlbl.textColor = UIColor.white
            dmDefLbl.textColor = UIColor.white
            defTipPerclbl.textColor = UIColor.white
            defLbl.textColor = UIColor.white
            currDefLbl.textColor = UIColor.white
            settingsLbl.textColor = UIColor.white
            defaults.set(1, forKey: "DMONOFF")
        } else {
            darkModeSwitchlbl.text = "Off"
            view.backgroundColor = UIColor.white
            darkModeSwitchlbl.textColor = UIColor.black
            dmDefLbl.textColor = UIColor.black
            defTipPerclbl.textColor = UIColor.black
            defLbl.textColor = UIColor.black
            currDefLbl.textColor = UIColor.black
            settingsLbl.textColor = UIColor.black
            defaults.set(0, forKey: "DMONOFF")
        }
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
