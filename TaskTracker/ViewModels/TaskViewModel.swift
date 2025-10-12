//
//  TaskViewModel.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//
import Foundation

class TaskViewModel {
    var taskList = TaskRepository.shared.taskDict
    var ascendingSorted = false;
    
    func getAllTasks() -> [TaskModel] {
        return Array(taskList.values)
    }
    
    func addNewTask(task : TaskModel) {
        if checkIfTaskExist(taskId:task.id){
            return;
        }
        taskList[task.id]=task
    }
    
    func sortTasksByName() -> [TaskModel] {
        let tasksArray : [TaskModel] = Array(taskList.values)
        if(ascendingSorted){
            ascendingSorted.toggle()
            return  tasksArray.sorted(by: {$0.title > $1.title})
        }else{
            ascendingSorted.toggle()
           return tasksArray.sorted(by: {$0.title < $1.title})
        }
    }
    
    func filterTasksByStatus(isCompleted : Bool) -> [TaskModel] {
        let tasksArray : [TaskModel] = Array(taskList.values)
        return tasksArray.filter({$0.isCompleted == isCompleted})
    }
    
    func toggleTaskStatus(taskId : UUID)-> [TaskModel]? {
        if var task = taskList[taskId]{
            task.isCompleted.toggle()
            taskList[taskId] = task
            return Array(taskList.values)
        }
        return nil
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
