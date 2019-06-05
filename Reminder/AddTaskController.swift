//
//  AddTaskController.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 6/3/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//

import UIKit

protocol AddTask {
    func addTask(name: String)
}

class AddTaskController: UIViewController {

    @IBOutlet weak var taskNameOutlet: UITextField!
    
    var delegate: AddTask?

    
    
    @IBAction func addAction(_ sender: Any) {
        //if textbox is empty
        if taskNameOutlet.text != "" {
            delegate?.addTask(name: taskNameOutlet.text!)
            
            //automatically go bakc to main screen
            navigationController?.popViewController(animated: true)
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
