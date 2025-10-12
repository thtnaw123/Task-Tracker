//
//  ImageManager.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//
import UIKit

class ImageManager {
    static let shared = ImageManager()
    
    private init() {}
    let logoImage = UIImage(named: "logo")
    let addTaskIcon  = UIImage(systemName: "plus.app")
    
    let squareIcon = UIImage(systemName: "square")
    let filledSquareIcon = UIImage(systemName: "checkmark.square.fill")
    
}

