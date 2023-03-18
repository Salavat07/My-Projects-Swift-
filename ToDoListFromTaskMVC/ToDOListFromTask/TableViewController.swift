//
//  TableViewController.swift
//  ToDOListFromTask
//
//  Created by Kaliev Salavat on 15.03.2023.
//

import UIKit

class TableViewController: UITableViewController, UISearchBarDelegate {

    let searchController = UISearchController()
    
    let model = Model()
    
    var alert = UIAlertController()
    
    @IBOutlet weak var addTaskButton: UIBarButtonItem!
    @IBOutlet weak var editModeButton: UIBarButtonItem!
    @IBOutlet weak var sortingTasksButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.definesPresentationContext = true
    
        searchController.searchBar.placeholder = "Find Your Task"
        
        navigationItem.searchController = searchController
        
        navigationItem.hidesSearchBarWhenScrolling = false
        
        definesPresentationContext = true
        
        searchController.searchBar.delegate = self
        
        tableView.separatorColor = .gray
        
        title = "Tasks"
        
        model.sortByTitle()
        tableView.reloadData()
        
    }

    
    
    // MARK: - SearchBar Methods
    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//
//    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.toDoItems.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomCell

        cell.delegate = self
        
        let currentItem = model.toDoItems[indexPath.row]
        cell.customCellTextLabel?.text = currentItem.string

        cell.accessoryType = currentItem.completed ? .checkmark : .none
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if model.changeState(at: indexPath.row) == true {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            model.toDoItems.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
        }

    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        model.moveItem(fromIndex: fromIndexPath.row, toIndex: to.row)
        
        tableView.reloadData()
    }
    
    
    override func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let editAction = UIContextualAction(style: .normal,
                                        title: "Edit") { [weak self] (action, view, completionHandler) in
            self?.editCellContent(indexPath: indexPath)
                                            completionHandler(true)
        }
        editAction.backgroundColor = .systemBlue
        
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    func editCellContent(indexPath: IndexPath) {

        let cell = tableView(tableView, cellForRowAt: indexPath) as! CustomCell
        
        alert = UIAlertController(title: "Edit your task", message: nil, preferredStyle: .alert)

        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .editingChanged)
            textField.text = cell.customCellTextLabel.text
            
        })
        
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        let editAlertAction = UIAlertAction(title: "Submit", style: .default) { (createAlert) in
            
            guard let textFields = self.alert.textFields, textFields.count > 0 else{
                return
            }
            
            guard let textValue = self.alert.textFields?[0].text else {
                return
            }
            
            self.model.updateItem(at: indexPath.row, with: textValue)
            
            self.tableView.reloadData()

        }
        
        alert.addAction(cancelAlertAction)
        alert.addAction(editAlertAction)
        present(alert, animated: true, completion: nil)
        
    }

    
    @objc func alertTextFieldDidChange(_ sender: UITextField) {

            guard let senderText = sender.text, alert.actions.indices.contains(1) else {
                return
            }

            let action = alert.actions[1]
            action.isEnabled = senderText.count > 0
        }
    
    @IBAction func addTaskButtonAction(_ sender: Any) {

        alert = UIAlertController(title: "Create new task", message: nil, preferredStyle: .alert)
        
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = "Put your task here"
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .editingChanged)
        }
        
        let createAlertAction = UIAlertAction(title: "Create", style: .default) { (createAlert) in
            // add new task
            
            guard let unwrTextFieldValue = self.alert.textFields?[0].text else {
                return
            }
            
            self.model.addItem(itemName: unwrTextFieldValue)
            self.model.sortByTitle()
            self.tableView.reloadData()
            
            
        }
        
        let cancelAlertAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addAction(cancelAlertAction)
        alert.addAction(createAlertAction)
        present(alert, animated: true, completion: nil)
        createAlertAction.isEnabled = false
    }
    
    @IBAction func editButton(_ sender: Any) {
        let editOn = UIImage(systemName: "pencil.slash")
        let editOff = UIImage(systemName: "pencil")
        tableView.setEditing(!tableView.isEditing, animated: true)
        
        model.editButtonClicked = !model.editButtonClicked
        editModeButton.image = model.editButtonClicked ? editOn : editOff
    }
    
    @IBAction func sortingTasksButtonAction(_ sender: Any) {
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        
        model.sortedAscending = !model.sortedAscending
        sortingTasksButton.image = model.sortedAscending ? arrowUp : arrowDown
        
        model.sortByTitle()
        
        tableView.reloadData()
    }
}


extension TableViewController: CustomCellDelegate {
    
    // MARK: - Cell Protocol Stubs
    
    
    func editCell(cell: CustomCell) {
        
        let indexPath = tableView.indexPath(for: cell)
        
        guard let unwrIndexPath = indexPath else {
            return
        }
        
        self.editCellContent(indexPath: unwrIndexPath)
        
    }
    
    func deleteCell(cell: CustomCell) {
        
        let indexPath = tableView.indexPath(for: cell)
        
        guard let unwrIndexPath = indexPath else {
            return
        }
        
        model.removeItem(at: unwrIndexPath.row)
        tableView.reloadData()
    }

}
