//
//  Model.swift
//  ToDOListFromTask
//
//  Created by Kaliev Salavat on 15.03.2023.
//

import Foundation
import UIKit


class Item {
    var string: String
    var completed: Bool
    
    init(string: String, completed: Bool) {
        self.string = string
        self.completed = completed
    }
}

class Model {
    
   var editButtonClicked: Bool = false
    
    var toDoItems: [Item] = [
                            Item(string: "Do something", completed: false),
                            Item(string: "Task1", completed: true),
                            Item(string: "Create app", completed: false),
                            ]
    
    var sortedAscending: Bool = true

    func addItem(itemName: String, isCompleted: Bool = false) {
        toDoItems.append(Item(string: itemName, completed: isCompleted))
    }

    func removeItem(at index: Int) {
        toDoItems.remove(at: index)
    }

    func moveItem(fromIndex: Int, toIndex: Int) {
        let from = toDoItems[fromIndex]
        toDoItems.remove(at: fromIndex)
        toDoItems.insert(from, at: toIndex)
    }

    func updateItem(at index: Int, with string: String) {
        toDoItems[index].string = string
    }

    func changeState(at item: Int) -> Bool {
        toDoItems[item].completed = !toDoItems[item].completed
    return toDoItems[item].completed
    }
    
    func sortByTitle() {
        toDoItems.sort {
            sortedAscending ? $0.string < $1.string : $0.string > $1.string
        }
    }
    
    func search() {
        
    }
}
