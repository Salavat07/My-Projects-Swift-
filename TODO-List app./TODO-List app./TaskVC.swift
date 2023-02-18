//
//  TaskVC.swift
//  TODO-List app.
//
//  Created by Salavat on 18.02.2023.
//

import UIKit

class TaskVC: UIViewController {

    @IBOutlet weak var userTaskField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    weak var saveTaskDeleagate: SaveUserTaskDelegate?

    

    @IBAction func saveTaskBtnPressed(_ sender: Any) {
        if let task = userTaskField.text {
               if !task.isEmpty {
                 let task = TaskModel(taskName: task, taskCellColor: .white)
                 saveTaskDeleagate?.saveTask(task: task)
                 dismiss(animated: true, completion: nil)
               }
             }
    }


}
