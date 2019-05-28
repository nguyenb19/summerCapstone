//
//  ExListScreenCell.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 5/25/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//

import UIKit

class ExListScreenCell: UITableViewCell {


    @IBOutlet weak var ExListView: UIImageView!
    @IBOutlet weak var ExListText: UILabel!
    
    
    func setImage(image: ImageView)
    {
        ExListView.image = image.image
        ExListText.text = image.title
    }
    

}
