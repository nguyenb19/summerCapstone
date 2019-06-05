//
//  reminderMain.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 5/20/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//


import Foundation
import UIKit

class reminderMain: UIViewController, UITableViewDelegate, UITableViewDataSource, AddTask, ChangeButton {
    
    
    var tasks: [Task] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        getTasks()
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "taskCell", for: indexPath) as! TaskCell
        
        cell.taskNameLabel.text = tasks[indexPath.row].name
        //check if we press
        if tasks[indexPath.row].checked {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkbox-5"), for: UIControl.State.normal)
            
        }
            //uncheck set image to default
        else {
            cell.checkBoxOutlet.setBackgroundImage(#imageLiteral(resourceName: "checkbox-4"), for: UIControl.State.normal)
        }
        
        cell.delegate = self
        cell.indexP = indexPath.row
        cell.tasks = tasks
        
        return cell
    }
    //click on plus button we can change things b4 going there
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! AddTaskController
        vc.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tasks.remove(at: indexPath.row)
            saveTasks()
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func addTask(name: String) {
        tasks.append(Task(name: name, checked:false))
        tableView.reloadData()
        saveTasks()
    }
    
    func changeButto(checked: Bool, index: Int) {
        tasks[index].checked = checked
        tableView.reloadData()
    }
    
    // to save tasks to disk
    func saveTasks() {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: tasks)
        userDefaults.set(encodedData, forKey: "tasks")
    }
    
    // to get tasks from disk
    func getTasks() {
        let userDefaults = UserDefaults.standard
        let decoded  = userDefaults.data(forKey: "tasks")
        if decoded != nil {
            tasks = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [Task]
        } else {
            tasks = []
        }
    }
}

class Task: NSObject, NSCoding {
    var name = ""
    var checked: Bool = false
    
    convenience init(name: String, checked: Bool)
    {
        self.init()
        self.name = name
        self.checked = checked
    }
    
    // to decode Task to display on table
    required convenience init(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let checked = aDecoder.decodeBool(forKey: "checked")
        self.init(name: name, checked: checked)
    }
    
    // to encode Task for save
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(checked, forKey: "checked")
    }
}

