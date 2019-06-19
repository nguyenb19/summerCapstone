//
//  ExListScreen.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 5/25/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//


import UIKit

class ExListScreen2: UIViewController {
    
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
        
        
        
        
        let image1 = ImageView(image: #imageLiteral(resourceName: "frontSquat"), title: "Front Squat")
        let image2 = ImageView(image: #imageLiteral(resourceName: "splitsquat"), title: "Bulgarian Split Squat")
        let image3 = ImageView(image: #imageLiteral(resourceName: "romaniandeadlift"), title: "Romanian Deadlift")
        
        
        //let image2 = ImageView(image: , title: T##String)
        //let image3 = #imageLiteral(resourceName: <#T##String#>)(resou)
        
        
        tempImages.append(image1)
        tempImages.append(image2)
        tempImages.append(image3)
        
        
        
        return tempImages
        
    }
    
    
    //viet 1 funct de push 1 viewcontroller moi
    
    
    func buttonPress()
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "Leg1") as UIViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
}

extension ExListScreen2: UITableViewDataSource, UITableViewDelegate
{
    //
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0
        {
            self.buttonPress()
        }
            
        else if indexPath.row == 1
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Leg2") as UIViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        
        if indexPath.row == 2
        {
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "Leg3") as UIViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
    
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

