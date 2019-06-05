//
//  TaskCell.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 6/2/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//

import UIKit

protocol  ChangeButton {
    func changeButto(checked: Bool, index: Int)
}

class TaskCell: UITableViewCell {
    
    
    @IBAction func checkBoxAction(_ sender: Any) {
        if tasks![indexP!].checked{
            
            delegate?.changeButto(checked: false, index: indexP!)
           
        }
        else {
            delegate?.changeButto(checked: true, index: indexP!)
            
        }
       
    }
    
    @IBOutlet weak var checkBoxOutlet: UIButton!
    
    @IBOutlet weak var taskNameLabel: UILabel!
    
    
    var delegate: ChangeButton?
    
    //index of the one we currently on
    
    var indexP: Int?
    var tasks: [Task]?
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
