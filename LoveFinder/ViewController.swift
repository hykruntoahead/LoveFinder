//
//  ViewController.swift
//  LoveFinder
//
//  Created by 何育昆 on 2017/4/12.
//  Copyright © 2017年 何育昆. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{
    @IBOutlet weak var nameTextFiled: UITextField!

    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var birthday: UIDatePicker!
    
    @IBOutlet weak var heightNumber: UISlider!
    @IBOutlet weak var height: UILabel!
    
    @IBOutlet weak var hasProperty: UISwitch!
    
    @IBOutlet weak var result: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //        绑定textFiled delegate
        nameTextFiled.delegate = self;
        result.lineBreakMode = NSLineBreakMode.byWordWrapping
        
        result.numberOfLines = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //    slider 绑定事件
    @IBAction func heightChange(_ sender: Any) {
        let slider = sender as? UISlider;
        height.text = "\(Int((slider?.value)!)) 厘米"
        
    }

    @IBAction func okTapped(_ sender: Any) {
        let genderText = gender.selectedSegmentIndex == 0 ?
            "高富帅" :"白富美";
//        let gregeorian =  NSCalendar(calendarIdentifier:NSCalendar.Identifier.gregorian);
        
        let birthSet = NSCalendar.current.dateComponents([Calendar.Component.year], from: birthday.date, to: Date());
        let age = birthSet.year!;
        
        
        let hasPropertyText = hasProperty.isOn ? "有房" : "没房"
        
        result.text = "\(nameTextFiled.text!),\(age)岁，\(genderText)，身高:\(height.text!),\(hasPropertyText) , 求交往！"
    }
    
       
    
    //重写 UITextFieldDelegate中textFieldShouldReturn
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder();
        return true
    }
}

