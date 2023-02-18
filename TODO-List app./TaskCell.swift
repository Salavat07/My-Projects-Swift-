//
//  TaskCell.swift
//  TODO-List app.
//
//  Created by Salavat on 16.02.2023.
//

import UIKit

class TaskCell: UITableViewCell {

    weak var removeTaskDelegate: RemoveTaskDelegate?
    weak var taskCompletedDelegate: TaskCompletedDelegate?
    
    var task:TaskModel?
    
    func cellData(task:TaskModel) {
        someTask.text = task.taskName
        viewCell.backgroundColor = task.taskCellColor
        self.task = task
      }
    
    @IBOutlet weak var someTask: UILabel!
    
    @IBOutlet weak var viewCell: UIView!
        override func awakeFromNib() {
        super.awakeFromNib()
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    @IBAction func removeTaskBtnPressed(_ sender: Any) {
        guard let task = task else { return }
         removeTaskDelegate?.removeTask(task: task)
        
    }
    
    @IBAction func executeTaskBtnPressed(_ sender: Any) {
        guard let task = task else { return }
           taskCompletedDelegate?.taskComplet(task: task)
    }
    
}
