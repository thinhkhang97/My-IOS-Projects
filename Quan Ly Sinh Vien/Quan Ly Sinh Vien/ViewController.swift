//
//  ViewController.swift
//  Quan Ly Sinh Vien
//
//  Created by Nguyen Thinh Khang on 3/26/18.
//  Copyright © 2018 Nguyen Thinh Khang. All rights reserved.
//

import UIKit


class Student{
    var name:String = ""
    var id:String = ""
    var dateOfBirth:String
    var faculty:String = ""
    init(_ Name:String, _ ID:String,_ DateOfBirth:String, _ Faculty:String) {
        name = Name;
        id = ID;
        dateOfBirth = DateOfBirth;
        faculty = Faculty;
    }
}

var listStudentName:Array<Student> = []
var isInEditMode:Bool = false
class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listStudentName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.studentName.text = listStudentName[indexPath.row].name
        cell.studentImg.image = UIImage(named: "images")
        return cell
    }
    
    
    // Event handler
    func transformDataToView2(_ studentInfoDetail:ViewController2 ,_ index:Int){
        studentInfoDetail.imgName = "images"
        studentInfoDetail.name = listStudentName[index].name
        studentInfoDetail.id = listStudentName[index].id
        studentInfoDetail.fac = listStudentName[index].faculty
        studentInfoDetail.year = listStudentName[index].dateOfBirth
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentInfoDetail:ViewController2 = storyboard?.instantiateViewController(withIdentifier: "mh2") as! ViewController2
        transformDataToView2(studentInfoDetail,indexPath.row)
        isEditMode = false
        self.navigationController?.pushViewController(studentInfoDetail, animated: true)
        print(indexPath.row)
    }
    
    
    func addListSTName(_ name:String, _ id:String,_ dateOfBirth:String,_ faculty:String){
        listStudentName.append(Student(name,id,dateOfBirth,faculty))
        print(name)
    }
    
    @IBAction func onAddTouch(_ sender: Any) {
        let addStudentView: ViewController3 = storyboard?.instantiateViewController(withIdentifier: "mh3") as! ViewController3
        self.navigationController?.pushViewController(addStudentView, animated: true)
    }
    
    
    @IBAction func onEditBtnTouch(_ sender: Any) {
        let studentInfoDetail:ViewController2 = storyboard?.instantiateViewController(withIdentifier: "mh2") as! ViewController2
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let selectedRow = cell.editBtn.tag
        transformDataToView2(studentInfoDetail, selectedRow)
        
        isEditMode = true
        self.navigationController?.pushViewController(studentInfoDetail, animated: true)
    }
    @IBAction func onDeleteBtnTouch(_ sender: Any) {
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        let selectedRow = cell.deleteBtn.tag
        listStudentName.remove(at: selectedRow)
        tableView.deleteRows(at: [IndexPath.init(row: selectedRow, section: 0)], with: .automatic)
        tableView.reloadData()
    }
    
    
    @IBOutlet weak var tableView: UITableView!
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle{
        return UITableViewCellEditingStyle.none
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true;
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        listStudentName.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    @IBOutlet weak var editButton: UIButton!
    
    @IBAction func nav_EditTouch(_ sender: Any) {
        if isInEditMode == false{
            isInEditMode = true
            editButton.setTitle("Done", for: .normal)
            let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
            cell.editBtn.isHidden = false
            cell.deleteBtn.isHidden = false
        }
        else{
            isInEditMode = false
            editButton.setTitle("Edit", for: .normal)
            let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
            cell.editBtn.isHidden = true
            cell.deleteBtn.isHidden = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            //addListSTName(student.name, student.id, student.dateOfBirth, student.faculty)
        tableView.dataSource = self
        tableView.delegate = self
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        cell.editBtn.isHidden = true
        cell.deleteBtn.isHidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

