//
//  ExListScreen.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 5/25/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//


import UIKit

class ExListScreen4: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    var images: [ImageView] = [] //create empty array
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        images = createArray()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func createArray() -> [ImageView] {
        
        var tempImages: [ImageView] = []
        
        
        
        
        let image1 = ImageView(image: #imageLiteral(resourceName: "Barbell Curl Images"), title: "Barbell Curl Images")
        let image2 = ImageView(image: #imageLiteral(resourceName: "Dumbbell Alternate Bicep Curl Images"), title: "Dumbbell Alternate Bicep Curl")
        let image3 = ImageView(image: #imageLiteral(resourceName: "Triceps Pushdown"), title: "Triceps Pushdown")
        
        
        //let image2 = ImageView(image: , title: T##String)
        //let image3 = #imageLiteral(resourceName: <#T##String#>)(resou)
        
        
        tempImages.append(image1)
        tempImages.append(image2)
        tempImages.append(image3)
        
        
        
        return tempImages
        
    }
    
    
}

extension ExListScreen4: UITableViewDataSource, UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let image = images[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageCell") as! ExListScreenCell
        
        cell.setImage(image: image)
        
        return cell
        
    }
    
    
}

