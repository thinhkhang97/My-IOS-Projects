//
//  ViewController2.swift
//  Quan Ly Sinh Vien
//
//  Created by Nguyen Thinh Khang on 3/26/18.
//  Copyright © 2018 Nguyen Thinh Khang. All rights reserved.
//

import UIKit

var isEditMode:Bool = false
class ViewController2: UIViewController {

    @IBOutlet weak var stImg: UIImageView!
    @IBOutlet weak var stName: UILabel!
    @IBOutlet weak var stID: UITextField!
    @IBOutlet weak var stFac: UITextField!
    @IBOutlet weak var stYear: UITextField!
    @IBOutlet weak var saveBtn: UIButton!
    
    var imgName:String = ""
    var name:String = ""
    var id:String = ""
    var fac:String = ""
    var year:String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        stImg.image = UIImage(named: imgName)
        stName.text = name
        stID.text = id
        stFac.text = fac
        stYear.text = year
        if isEditMode==false{
            stID.isEnabled = false
            stFac.isEnabled = false
            stYear.isEnabled = false
            saveBtn.isHidden = true
        }
        else{
            stID.isEnabled = true
            stFac.isEnabled = true
            stYear.isEnabled = true
            saveBtn.isHidden = false
        }
        // Do any additional setup after loading the view.
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
