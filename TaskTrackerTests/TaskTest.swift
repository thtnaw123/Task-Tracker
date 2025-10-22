//
//  TaskTest.swift
//  TaskTrackerTests
//
//  Created by Tihitinaw Buzuwek on 21/10/2025.
//

import XCTest
@testable import TaskTracker
final class TaskTest: XCTestCase {
    var taskViewModel:TaskViewModel!

    override func setUp(){
        super.setUp()
        taskViewModel = TaskViewModel()
    }
    
    override func tearDown() {
        taskViewModel = nil
        super.tearDown()
    }
    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }

    func testTaskViewModel() throws {
        let taskA = TaskModel(title: "Buy milk", isCompleted: false)
        let taskB = TaskModel(title: "Call Alice", isCompleted: true)
        let taskC = TaskModel(title: "Attend meeting", isCompleted: false)

        taskViewModel.currentTasks = [taskA, taskB, taskC]
        
        // Act
        let sortedTasks = taskViewModel.sortTasksByName(isAscending: true)

        // Assert
        let sortedTitles = sortedTasks.map{ $0.title }
        XCTAssertEqual(sortedTitles, ["Attend meeting", "Buy milk", "Call Alice"])
        
        let filterTasks = taskViewModel.filterTasksByStatus(isCompleted: true)
        XCTAssertEqual(taskViewModel.currentTasks, filterTasks)
        
 
    }
    
    func testToggleTaskStatus() throws {
        var taskA = TaskModel(title: "Buy milk", isCompleted: false)
        let taskB = TaskModel(title: "Call Alice", isCompleted: true)
        let taskC = TaskModel(title: "Attend meeting", isCompleted: false)
        
        taskViewModel.currentTasks = [taskA, taskB, taskC]
        TaskRepository.shared.taskDict = Dictionary(uniqueKeysWithValues: taskViewModel.currentTasks.map { ($0.id, $0) })
        
        let returnedTasks = taskViewModel.toggleTaskStatus(taskId: taskA.id)
        
        taskA.isCompleted = true
        let toggledTask = [taskA, taskB, taskC]
        XCTAssertEqual(returnedTasks, toggledTask)
        
    }
    
    func testAddTask() throws {
        let taskC = TaskModel(title: "Attend meeting", isCompleted: false)
        taskViewModel.addNewTask(task: taskC)
        XCTAssertTrue(taskViewModel.getCurrentTasks.contains(taskC))
    }
    
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
//    given
//    test
//    assert

}
