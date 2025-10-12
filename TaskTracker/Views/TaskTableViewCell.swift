//
//  TaskTableViewCell.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import UIKit

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
   
    @IBOutlet weak var addTaskButton: UIButton!
    
    static var identifier = "taskTableViewCell"

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = ColorManager.shared.backgroundColor

        addTaskButton.isSelected = false
                    
        addTaskButton.setImage(ImageManager.shared.squareIcon, for: .normal)
        addTaskButton.setImage(ImageManager.shared.filledSquareIcon, for: .selected)
    }

    @IBAction func checkBoxClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        if sender.isSelected {
            print("Checked")
        } else {
            print("unchecked")
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
