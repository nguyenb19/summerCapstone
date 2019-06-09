//
//  ExListScreen.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 5/25/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//


import UIKit

class ExListScreen5: UIViewController {
    
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
        
        
        
        
        let image1 = ImageView(image: #imageLiteral(resourceName: "Dumbbell crunch reach"), title: "Dumbbell Crunch Reach")
        let image2 = ImageView(image: #imageLiteral(resourceName: "Mountain climber"), title: "Mountain Climber")
        let image3 = ImageView(image: #imageLiteral(resourceName: "Seated dumbbell Russian twist"), title: "Seated Dumbbell Russian Twist")
        
        
        //let image2 = ImageView(image: , title: T##String)
        //let image3 = #imageLiteral(resourceName: <#T##String#>)(resou)
        
        
        tempImages.append(image1)
        tempImages.append(image2)
        tempImages.append(image3)
        
        
        
        return tempImages
        
    }
    
    
}

extension ExListScreen5: UITableViewDataSource, UITableViewDelegate
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

