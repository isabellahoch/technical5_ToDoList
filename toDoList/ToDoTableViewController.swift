//
//  ToDoTableViewController.swift
//  toDoList
//
//  Created by Apple on 7/12/19.
//  Copyright © 2019 KWK. All rights reserved.
//

import UIKit

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDo] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        toDos = createToDos()
    }
    
    func createToDos() -> [ToDo] {
        
        let brainBreak = ToDo()
        brainBreak.name = "take a brain break"
        brainBreak.important = true
        
        let burrito = ToDo()
        burrito.name = "order a burrito on caviar"
        // important is set to false by default
        
        return [brainBreak, burrito]
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        let toDo = toDos[indexPath.row]
        
        if toDo.important {
            cell.textLabel?.text = "❗️ \(toDo.name)"
        }
        else {
            cell.textLabel?.text = toDo.name
        }

        return cell
    }

}
