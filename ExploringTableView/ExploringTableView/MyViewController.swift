//
//  MyViewController.swift
//  ExploringTableView
//
//  Created by Salavat on 14.02.2023.
//

import UIKit

class MyViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {
    
    let userArray = ["Евгения", "Николай", "Катерина", "Станислав", "Артур", "Марина", "Вячеслав", "Перт"]

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // берем массив и получаем общее значение данных которые хранятся в нем
        return userArray.count
      }
    // высота между строками
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Contacts"
    }
    // text in the end of list
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return "End in the section"
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    // отвечает за создание ячейки
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "UniversalCell", bundle: nil), forCellReuseIdentifier: "UniversalCell")
     
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UniversalCell", for: indexPath) as? UniversalCell else { return UITableViewCell() }
        cell.userName.text = userArray[indexPath.row]
        return cell
      }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
