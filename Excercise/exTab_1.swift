//
//  exTab_1.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 5/22/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//

import Foundation
import UIKit

class exTab_1: UIViewController, UITableViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    func numberOfSections(in exTab_1: UITableView) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    // how the underscore work 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
            
            
            
        return cell
        }
        
    }
    
  
}


