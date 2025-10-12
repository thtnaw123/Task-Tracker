//
//  TaskFilterViewViewController.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import UIKit

class TaskFilterView: UIView {

   var viewController = ViewController()
   let filterTaskButton = UIButton(type: .system)
   let sortButton = UIButton(type: .system)
   let stackView = UIStackView()
   var isCompleted: Bool = true
    

    init(viewController: ViewController) {
           self.viewController = viewController
           super.init(frame: .zero)
           setUpFilterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpFilterView() {
        filterTaskButton.setTitle("Filter Task", for: .normal)
        sortButton.setTitle("Sort", for: .normal)
        filterTaskButton.addTarget(self, action: #selector(filterTasks), for: .touchUpInside)
        sortButton.addTarget(self, action: #selector(sortTasks), for: .touchUpInside)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        stackView.addArrangedSubview(filterTaskButton)
        stackView.addArrangedSubview(sortButton)
        
        addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
    
    @objc func sortTasks() {
        viewController.sortTasksByName()
    }
    
    @objc func filterTasks() {
        isCompleted ? viewController.filterByTaskStatus(isCompleted: true): viewController.filterByTaskStatus(isCompleted: false)
        isCompleted.toggle()
    }
  

}
