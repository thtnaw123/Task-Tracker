//
//  ViewController.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import UIKit
import Foundation

class ViewController: UIViewController{
    
    var taskListTableView = UITableView()
    
    let taskViewModel = TaskViewModel()
    
    lazy var taskList = taskViewModel.getCurrentTasks
    

    override func viewDidLoad() {
        super.viewDidLoad()        
        setBackgroundColor()
        setUpTaskListHeaderView()
        setUpTaskFilterView()
    }
    
    func setBackgroundColor(){
        view.backgroundColor = ColorManager.shared.backgroundColor
    }
    
    
    func setUpTaskListHeaderView(){
        let taskListHeaderView = TaskListHeaderView(viewController: self)
        taskListHeaderView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(taskListHeaderView)
        
        NSLayoutConstraint.activate([
            taskListHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            taskListHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            taskListHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            taskListHeaderView.heightAnchor.constraint(equalToConstant: 200)

        ])
        
        setUpTableView(taskListHeaderView:taskListHeaderView)
    }
    
    func setUpTableView(taskListHeaderView:TaskListHeaderView){
           let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
           taskListTableView.register(nib,
                              forCellReuseIdentifier: TaskTableViewCell.identifier)
           taskListTableView.delegate = self
           taskListTableView.dataSource = self
           taskListTableView.backgroundColor = ColorManager.shared.backgroundColor
           
           view.addSubview(taskListTableView)
           taskListTableView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               taskListTableView.topAnchor.constraint(equalTo: taskListHeaderView.bottomAnchor, constant: 40),
               taskListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
               taskListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
               taskListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 300)
           ])
    }
    
    func setUpTaskFilterView(){
        let taskFilterView = TaskFilterView(viewController: self)

        taskFilterView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(taskFilterView)
        
        NSLayoutConstraint.activate([
            taskFilterView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            taskFilterView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            taskFilterView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            taskFilterView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func sortTasksByName(isAscending: Bool){
        taskList = taskViewModel.sortTasksByName(isAscending: isAscending)
        taskListTableView.reloadData()
    }
    
    func resetAllTasks(){
        taskList = taskViewModel.getAllTaskList
        taskListTableView.reloadData()
    }
    
    func filterByTaskStatus(isCompleted: Bool){
        taskList = taskViewModel.filterTasksByStatus(isCompleted: isCompleted)
        taskListTableView.reloadData()
    }
    

    func addNewTask(taskTitle: String?){
        let validator = Validator()
        if validator.checkIfEmpty(taskTitle) {
            return;
        }
        
        let newTask = TaskModel(title: taskTitle!, isCompleted:false)
        taskViewModel.addNewTask(task: newTask)
        taskList = taskViewModel.getCurrentTasks
        taskListTableView.reloadData()
    }


}

