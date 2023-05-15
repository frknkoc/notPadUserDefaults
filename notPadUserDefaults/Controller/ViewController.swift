//
//  ViewController.swift
//  notPadUserDefaults
//
//  Created by furkan on 15.05.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var not: UITextField!
    
    
    @IBOutlet weak var date: UITextField!
    
    @IBOutlet weak var notLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var alertLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                notLabel.isHidden = true
                dateLabel.isHidden = true
                alertLabel.isHidden = true
        
        let savedNot = UserDefaults.standard.object(forKey: "not")
        let savedDate = UserDefaults.standard.object(forKey: "date")
        
        if let gelenNot = savedNot as? String{
            notLabel.text = "Yapılacak İş : \(gelenNot)"
        }
        if let gelenDate = savedDate as? String{
            dateLabel.text = "Yapılacak Zaman : \(gelenDate)"
        }
}
    
    @IBAction func saveNote(_ sender: Any) {
        if not.text != ""{
            if date.text != ""{
               notLabel.isHidden = false
              dateLabel.isHidden = false
               alertLabel.isHidden = false
                alertLabel.textColor = UIColor.systemGreen
                alertLabel.text = "Not Added"
                notLabel.text = "Work to do : \(not.text!)"
                dateLabel.text = "Time to do : \(date.text!)"

                UserDefaults.standard.set(notLabel.text, forKey: "not")
                UserDefaults.standard.set(dateLabel.text, forKey: "zaman")
            }
            else {
                notLabel.isHidden = true
                dateLabel.isHidden = true
                alertLabel.isHidden = false
                alertLabel.text = "Date can not be spaced"
            }
        } else {
            notLabel.isHidden = true
         dateLabel.isHidden = true
           alertLabel.isHidden = false
            alertLabel.textColor = UIColor.systemRed
            alertLabel.text = "Can not be left blank"
        }
        
        UserDefaults.standard.set(not.text!, forKey: "not")
        UserDefaults.standard.set(date.text!, forKey: "date")
        
        notLabel.text = "Work to do : \(not.text!)"
        
        dateLabel.text = "Time to do : \(date.text!)"
        
        not.text = ""
        date.text = ""

    }
        
        @IBAction func deleteNote(_ sender: Any) {
            let savedNot = UserDefaults.standard.object(forKey: "not")
            let savedDate = UserDefaults.standard.object(forKey: "date")
            
            if (savedNot as? String) != nil{
                notLabel.text = ""
            }
            if (savedDate as? String) != nil{
                dateLabel.text = ""
            }
            not.text = ""
            date.text = ""
            alertLabel.isHidden = true
        }
    }
