//
//  ViewController+TaskTableViewCellDelgate.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import Foundation

extension ViewController: TaskTableViewCellDelgate {
    func changeTaskStatusHandler(taskId: UUID) {
        if let tasksLocalVar = taskViewModel.toggleTaskStatus(taskId: taskId) {
            taskList = tasksLocalVar
        }
        taskListTableView.reloadData()
    }

}
