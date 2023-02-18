//
//  Delegates.swift
//  TODO-List app.
//
//  Created by Salavat on 18.02.2023.
//

import UIKit

    protocol SaveUserTaskDelegate: class {
    func saveTask(task: TaskModel)
  }
    protocol RemoveTaskDelegate: class {
  func removeTask(task: TaskModel)
}
 
    protocol TaskCompletedDelegate: class {
  func taskComplet(task: TaskModel)
}
