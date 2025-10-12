//
//  ViewController+TableViewDelgate.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import Foundation

import UIKit

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
