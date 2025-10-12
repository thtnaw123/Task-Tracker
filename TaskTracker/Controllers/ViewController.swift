//
//  ViewController.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import UIKit

class ViewController: UIViewController {
    
    var logoImageView = UIImageView()
    
    var stackView = UIStackView()
    
    var taskTextField = UITextField()
    
    var addButton = UIButton(type:.system)
    



    override func viewDidLoad() {
        super.viewDidLoad()
//        overrideUserInterfaceStyle = .dark
        setBackgroundColor()
        setUpLogoImage()
        setUpUI()
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
    
   
    
    @objc func addTask() {
        
    }


}

