//
//  TaskListHeader.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 13/10/2025.
//

import UIKit

class TaskListHeaderView: UIView {
    var viewController = ViewController()

    var logoImageView = UIImageView()
    
    var stackView = UIStackView()
    
    var taskTextField = UITextField()
    
    var addButton = UIButton(type:.system)
    
    init(viewController: ViewController) {
           self.viewController = viewController
           super.init(frame: .zero)
           setUpLogoImage()
           setTaskAddFormUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUpLogoImage(){
        logoImageView = UIImageView(image: ImageManager.shared.logoImage)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(logoImageView)
        
        NSLayoutConstraint.activate([
            logoImageView.centerXAnchor.constraint(equalTo:centerXAnchor),
            logoImageView.topAnchor.constraint(equalTo:topAnchor, constant: 40),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100)
        ])
        
    }
    
    
   
    func setTaskAddFormUI() {
   
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
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
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 40)
            
        ])
    }
    
    @objc func addTask() {
        viewController.addNewTask(taskTitle:taskTextField.text)
        taskTextField.text = ""
    }

}
