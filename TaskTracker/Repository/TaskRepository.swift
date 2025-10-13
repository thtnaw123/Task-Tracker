//
//  TaskRepository.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import Foundation

class TaskRepository {
    static var shared = TaskRepository()
    private init(){}
    
    let task1 = TaskModel(title: "Task 1", isCompleted: false)
    let task2 = TaskModel(title: "Task 2", isCompleted: false)
    let task3 = TaskModel(title: "Task 3", isCompleted: false)
    let task4 = TaskModel(title: "Task 4", isCompleted: false)
    let task5 = TaskModel(title: "Task 5", isCompleted: false)

    
    lazy var taskDict:[UUID:TaskModel] = [task1.id:task1,
                                  task2.id:task2,
                                  task3.id:task3,
                                  task4.id:task4,
                                  task5.id:task5]

}
