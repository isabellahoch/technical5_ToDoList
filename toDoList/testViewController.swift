//
//  testViewController.swift
//  toDoList
//
//  Created by Apple on 7/15/19.
//  Copyright © 2019 KWK. All rights reserved.
//

import UIKit

class testViewController: UIViewController {
    
    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var testTextField: UITextField!
    
    @IBOutlet weak var testImportantSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func testAddTapped(_ sender: Any) {
//        let toDo = ToDo()
//
//        if let titleText = testTextField.text {
//            toDo.name = titleText
//            toDo.important = testImportantSwitch.isOn
//        }
//
//        previousVC.toDos.append(toDo)
//        previousVC.tableView.reloadData()
//        navigationController?.popViewController(animated: true)
        
        // we have to grab this view context to be able to work with Core Data
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            // we are creating a new ToDoCD object here, naming it toDo
            let toDo = ToDoCD(entity: ToDoCD.entity(), insertInto: context)
            
            // if the titleTextField has text, we will call that text titleText
            if let titleText = testTextField.text {
                // we will take the titleText and assign that value to toDo.name
                // this .name and .important came from the attributes you typed in on the Core Data page!
                toDo.name = titleText
                toDo.important = testImportantSwitch.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
        }
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
