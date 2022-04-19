//
//  ViewController.swift
//  textField ve Picker
//
//  Created by İSMAİL AÇIKYÜREK on 19.04.2022.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
 


    @IBOutlet weak var textUlke: UITextField!
    
    var pickerView : UIPickerView?
    var ulkeler : [String] = [String]()


    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        ulkeler = ["almanya","turkiye","japonya","rusya","italya"]
        
        pickerView = UIPickerView()
        pickerView?.dataSource = self
        pickerView?.delegate = self
        
        textUlke.inputView = pickerView
        
        
        let toolBar = UIToolbar()
        toolBar.tintColor = UIColor.red
        toolBar.sizeToFit() //toolbar boyutlandırma
        
        
        let tamamButon = UIBarButtonItem(title: "tamam", style: .plain, target: self, action: #selector(tamamtikla))
        let boslukButon = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let iptalButon = UIBarButtonItem(title: "iptal", style: .plain, target: self, action: #selector(iptaltikla))
        toolBar.setItems([iptalButon,boslukButon,tamamButon], animated: false)
        textUlke.inputAccessoryView = toolBar
        
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        ulkeler.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        ulkeler[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textUlke.text = ulkeler[row]
    }
    
    
    
    @objc func tamamtikla() {
      
        view.endEditing(true)
    }
    @objc func iptaltikla() {
        textUlke.text = ""
        textUlke.text = "ULKE SEÇ"
        view.endEditing(true)
    }
}


    

