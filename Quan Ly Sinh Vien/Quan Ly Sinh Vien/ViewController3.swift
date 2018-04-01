//
//  ViewController3.swift
//  Quan Ly Sinh Vien
//
//  Created by Nguyen Thinh Khang on 3/26/18.
//  Copyright © 2018 Nguyen Thinh Khang. All rights reserved.
//

import UIKit

class ViewController3: UIViewController,UIPickerViewDelegate {

    @IBOutlet weak var nameInputed: UITextField!
    @IBOutlet weak var idInputed: UITextField!
    @IBOutlet weak var dateOfBirthInputed: UITextField!
    @IBOutlet weak var facultyInputed: UITextField!
    @IBOutlet weak var datePickerView: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()
        datePickerView.isHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func onChangeDateOfBirth(_ sender: Any) {
        datePickerView.isHidden = false
    }
    @IBAction func outOfDateOfBirth(_ sender: Any) {
        datePickerView.isHidden = true
    }
    @IBAction func saveTouch(_ sender: Any) {
        let viewControl1:ViewController = storyboard?.instantiateViewController(withIdentifier: "mh1") as! ViewController
        //viewControl1.addListSTName(nameInputed.text!, idInputed.text!, dateOfBirthInputed.text!, facultyInputed.text!)
        listStudentName.append(Student(nameInputed.text!, idInputed.text!, dateOfBirthInputed.text!, facultyInputed.text!))
    }
    
    @IBAction func datePickerValueChagne(_ sender: Any) {
        let date = datePickerView.date
        let formater = DateFormatter()
        formater.dateFormat = "dd-MM-yyyy"
        formater.dateStyle = .medium
        formater.timeStyle = .none
        let dateString = formater.string(from: date)
        dateOfBirthInputed.text = dateString
    }
    public func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        print(row)
        print(component)
        let date = datePickerView.date
        let formater = DateFormatter()
        formater.dateStyle = .medium
        formater.timeStyle = .none
        let dateString = formater.string(from: date)
        print(dateString)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
