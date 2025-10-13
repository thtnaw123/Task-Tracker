//
//  TaskTableViewCell.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import UIKit
protocol TaskTableViewCellDelgate : NSObject {
   func changeTaskStatusHandler(taskIndex: Int)
}

class TaskTableViewCell: UITableViewCell {

    @IBOutlet weak var taskLabel: UILabel!
   
    @IBOutlet weak var addTaskButton: UIButton!
    
    static var identifier = "taskTableViewCell"
    
    var delgate:TaskTableViewCellDelgate?
    
    var targetTask: TaskModel! {
        didSet {
        taskLabel.text = targetTask.title
        setUpCheckBox(isSelected: targetTask.isCompleted)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setUpCheckBox(isSelected: Bool) {
        addTaskButton.isSelected = isSelected
        addTaskButton.setImage(ImageManager.shared.squareIcon, for: .normal)
        addTaskButton.setImage(ImageManager.shared.filledSquareIcon, for: .selected)
    }

    @IBAction func checkBoxClicked(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        delgate?.changeTaskStatusHandler(taskIndex: sender.tag)
    }
    
    func hydrateCell(index:Int){
        taskLabel?.text = targetTask.title
        addTaskButton.tag = index
        if targetTask.isCompleted {
            taskLabel?.textColor = .gray
        }else {
            taskLabel?.textColor = ColorManager.shared.primaryColor
        }
    }
    
    
}
