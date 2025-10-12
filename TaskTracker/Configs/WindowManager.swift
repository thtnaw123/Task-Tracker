//
//  WindowManager.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//
import UIKit

class WindowManager{
    let windowScene: UIWindowScene
    
    init(windowScene: UIWindowScene) {
        self.windowScene = windowScene
    }
    
    func start() -> UIWindow {
        let window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window.rootViewController = ViewController()
        window.windowScene = windowScene
        window.makeKeyAndVisible()
        
        return window
    }
    

}
