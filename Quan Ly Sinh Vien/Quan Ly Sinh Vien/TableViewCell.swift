//
//  TableViewCell.swift
//  Quan Ly Sinh Vien
//
//  Created by Nguyen Thinh Khang on 3/26/18.
//  Copyright © 2018 Nguyen Thinh Khang. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var studentImg: UIImageView!
    @IBOutlet weak var studentName: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var deleteBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        if isInEditMode == false{
        editBtn.isHidden = true
        deleteBtn.isHidden = true
        }
        else{
            editBtn.isHidden = false
            deleteBtn.isHidden = false
            
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
