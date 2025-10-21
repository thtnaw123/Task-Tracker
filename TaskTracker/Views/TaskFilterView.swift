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
   let resetButton = UIButton(type: .system)
   let stackView = UIStackView()
   var isCompleted: Bool = true
   var isAscending: Bool = false
    

    init(viewController: ViewController) {
           self.viewController = viewController
           super.init(frame: .zero)
           setUpFilterView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUpFilterView() {
        filterTaskButton.setImage(ImageManager.shared.filterIcon, for: .normal)
        sortButton.setImage(ImageManager.shared.sortIcon, for: .normal)
        resetButton.setImage(ImageManager.shared.resetIcon, for: .normal)

        resetButton.addTarget(self, action: #selector(resetTasks), for: .touchUpInside)
        sortButton.addTarget(self, action: #selector(sortTasks), for: .touchUpInside)
        filterTaskButton.addTarget(self, action: #selector(filterTasks), for: .touchUpInside)
        
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        
        stackView.addArrangedSubview(filterTaskButton)
        stackView.addArrangedSubview(sortButton)
        stackView.addArrangedSubview(resetButton)
        
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
        viewController.sortTasksByName(isAscending: isAscending)
        isAscending.toggle()
    }
    
    @objc func resetTasks() {
        viewController.resetAllTasks()
    }
    
    
    @objc func filterTasks() {
        viewController.filterByTaskStatus(isCompleted: isCompleted)
        isCompleted.toggle()
    }
  

}
