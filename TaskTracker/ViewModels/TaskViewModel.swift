//
//  TaskViewModel.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//
import Foundation

class TaskViewModel {
    var taskList = TaskRepository.shared.taskDict
    
    func getAllTasks() -> [TaskModel] {
        return Array(taskList.values)
    }
    
    func addNewTask(task : TaskModel) {
        if checkIfTaskExist(taskId:task.id){
            return;
        }
        taskList[task.id]=task
    }
    
    func toggleTaskStatus(taskId : UUID) {
        if var task = taskList[taskId]{
            task.isCompleted.toggle()
            taskList[taskId] = task
        }
    }
    
    func getAllTasksCount() -> Int {
        return taskList.count
    }
    
    func checkIfTaskExist(taskId : UUID) -> Bool {
        if let _ = taskList[taskId] {
            return true
        }
        return false
    }
    
    
}
