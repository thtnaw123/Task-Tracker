//
//  TaskViewModel.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//
import Foundation

class TaskViewModel {
    var taskList : [TaskModel]  = []
    var currentTasks : [TaskModel] = []
    var taskCount: Int { currentTasks.count }

    init(){
        initRepository()
    }
    
    func initRepository(){
        if TaskRepository.shared.getTasks().isEmpty{
             TaskRepository.shared.initList(taskList:TaskRepository.shared.taskListSeedData)
        }
        taskList = TaskRepository.shared.getTasks()
        TaskRepository.shared.taskDict = Dictionary(uniqueKeysWithValues: taskList.map { ($0.id, $0) })
        currentTasks = taskList
    }
    
    var getCurrentTasks: [TaskModel]  { currentTasks }
    var getAllTaskList : [TaskModel] {taskList}
    func addNewTask(task : TaskModel) {
        if checkIfTaskExist(taskId:task.id){
            return
        }
        TaskRepository.shared.taskDict[task.id] = task
        taskList.append(task)
        currentTasks = taskList
        TaskRepository.shared.saveAllTask(taskList)
    }
    
    func sortTasksByName(isAscending : Bool) -> [TaskModel] {
        if isAscending {
            currentTasks = currentTasks.sorted(by: {$0.title < $1.title})
            return  currentTasks
        }else{
            currentTasks = currentTasks.sorted(by: {$0.title > $1.title})
           return currentTasks
        }
    }
    
    func filterTasksByStatus(isCompleted : Bool) -> [TaskModel] {
        currentTasks = taskList.filter{$0.isCompleted == isCompleted}
        return currentTasks
    }
    
    func toggleTaskStatus(taskId : UUID)-> [TaskModel]? {
        guard checkIfTaskExist(taskId: taskId) else {
            return nil
        }
        if let currentIndex = currentTasks.firstIndex(where: { $0.id == taskId }) {
            currentTasks[currentIndex].isCompleted.toggle()
            taskList[currentIndex].isCompleted.toggle()
            TaskRepository.shared.taskDict[taskId] = taskList[currentIndex]
            TaskRepository.shared.saveAllTask(taskList)
            
            PrintDebug.printDebug("\(taskId) complete state changed")

        }
        
        return currentTasks
    }
    
    func getTaskById(taskId : UUID) -> TaskModel? {
        return taskList.first{$0.id == taskId}
    }
    
    
    func checkIfTaskExist(taskId : UUID) -> Bool {
        return TaskRepository.shared.taskDict[taskId] != nil
    }
    
    
}


