//
//  InputValidator.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import Foundation

class Validator {
    func checkIfEmpty(_ input: String?) -> Bool {
        guard let input = input else {
            return false
        }
        return input.isEmpty
    }
    
}
