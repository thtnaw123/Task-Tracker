//
//  ViewController.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import UIKit
import Foundation

class ViewController: UIViewController{
    
    var logoImageView = UIImageView()
    
    var stackView = UIStackView()
    
    var taskTextField = UITextField()
    
    var addButton = UIButton(type:.system)
    
    var taskListTableView = UITableView()
    
    let taskViewModel = TaskViewModel()
    

    lazy var taskList = taskViewModel.getAllTasks()


    override func viewDidLoad() {
        super.viewDidLoad()
//        overrideUserInterfaceStyle = .dark
        
        setBackgroundColor()
        setUpLogoImage()
        setUpUI()
        setUpTableView()
        setUpTaskFilterView()
    }
    
    func setBackgroundColor(){
        view.backgroundColor = ColorManager.shared.backgroundColor
    }
    
    func setUpLogoImage(){
        logoImageView = UIImageView(image: ImageManager.shared.logoImage)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100)
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
    
    func sortTasksByName(){
        taskList = taskViewModel.sortTasksByName()
        taskListTableView.reloadData()
    }
    
    func filterByTaskStatus(isCompleted: Bool){
        taskList = taskViewModel.filterTasksByStatus(isCompleted: isCompleted)
        taskListTableView.reloadData()
    }
    
    
    func setUpUI() {
   
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)
        
        taskTextField.placeholder = "Enter task"
        taskTextField.textColor = .label
        taskTextField.borderStyle = .roundedRect
        taskTextField.layer.borderWidth = 1
        taskTextField.layer.borderColor = ColorManager.shared.primaryColor?.cgColor
        taskTextField.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(taskTextField)
        
        addButton.addTarget(self, action: #selector(addTask), for: .touchUpInside)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = ColorManager.shared.secondaryColor
        let icon = ImageManager.shared.addTaskIcon
        addButton.setImage(icon, for: .normal)
        addButton.tintColor = ColorManager.shared.primaryColor
        addButton.layer.cornerRadius = 8

        
        stackView.addArrangedSubview(addButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40)
            
        ])
    }
    
    func setUpTableView(){
           let nib = UINib(nibName: "TaskTableViewCell", bundle: nil)
           taskListTableView.register(nib,
                              forCellReuseIdentifier: TaskTableViewCell.identifier)
           taskListTableView.delegate = self
           taskListTableView.dataSource = self
           taskListTableView.backgroundColor = ColorManager.shared.backgroundColor
           
           view.addSubview(taskListTableView)
           taskListTableView.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
               taskListTableView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
               taskListTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
               taskListTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
               taskListTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 300)
           ])
       }
    
   
    
    @objc func addTask() {
        let validator = Validator()
        if validator.checkIfEmpty(taskTextField.text) {
            return;
        }
        
        let newTask = TaskModel(title: taskTextField.text!, isCompleted:false)
        taskViewModel.addNewTask(task: newTask)
        taskList = taskViewModel.getAllTasks()
        taskListTableView.reloadData()
        taskTextField.text = ""
    }


}

