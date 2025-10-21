//
//  ColorManager.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import UIKit
class ColorManager{
    static let shared = ColorManager()
    private init(){}
    let backgroundColor = UIColor(named: "BackGround")
    let primaryColor = UIColor(named: "PrimaryColor")
    let secondaryColor = UIColor(named: "SecondaryColor")
    let dimColor = UIColor(.gray)
}
