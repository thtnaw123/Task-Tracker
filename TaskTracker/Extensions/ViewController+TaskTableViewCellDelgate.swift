//
//  ViewController+TaskTableViewCellDelgate.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import Foundation

extension ViewController: TaskTableViewCellDelgate {
    func changeTaskStatusHandler(taskIndex: Int) {
        let targetTask = taskViewModel.getAllTasks()[taskIndex]
        taskViewModel.toggleTaskStatus(taskId: targetTask.id)
        taskListTableView.reloadData()
    }
    
    
}
