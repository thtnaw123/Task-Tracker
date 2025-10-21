//
//  TaskRepository.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import Foundation

class TaskRepository {
    static var shared = TaskRepository()
    let userDefaults = UserDefaults.standard

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
    lazy var taskListSeedData:[TaskModel] = [task1, task2, task3, task4, task5]

    
    func initList(taskList: [TaskModel]) {
        let encoder = JSONEncoder()
        do{
            let encoded = try encoder.encode(taskList)
            PrintDebug.printDebug("init task list")
            UserDefaults.standard.set(encoded, forKey: "taskList")
        }catch{
            print("error saving data")
        }
    }

    
    func saveTask(_ task:TaskModel){
        var taskList = getTasks()
        taskList.append(task)
        PrintDebug.printDebug("save task")
        initList(taskList: taskList)
    }
    
    func saveAllTask(_ tasks:[TaskModel]){
        PrintDebug.printDebug("saving all tasks")
        initList(taskList:tasks)
    }
    
    func getTasks() -> [TaskModel] {
        if let data = UserDefaults.standard.data(forKey: "taskList") {
            let decoder = JSONDecoder()
            do {
                let decoded = try decoder.decode([TaskModel].self, from: data)
                PrintDebug.printDebug("getting tasks")
                return decoded
            } catch {
                print("Decoding failed:", error)
                return []
            }
        }
        return []
        
    }

}
