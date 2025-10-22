//
//  TaskModel.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import Foundation


struct TaskModel: Identifiable, Codable,Equatable {
    var id = UUID()
    var title: String
    var isCompleted: Bool
}
