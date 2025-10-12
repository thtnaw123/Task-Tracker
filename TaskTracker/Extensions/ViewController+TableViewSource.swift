//
//  ViewController+TableViewSource.swift
//  TaskTracker
//
//  Created by Tihitinaw Buzuwek on 12/10/2025.
//

import Foundation
import UIKit

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else{
            return UITableViewCell()
        }
        cell.taskLabel?.text = items[indexPath.row]
        
        return cell
    }
}
