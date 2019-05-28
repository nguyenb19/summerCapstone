//
//  timerMain.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 5/20/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//


import Foundation
import UIKit

class timerMain: UIViewController {
    
    var seconds = 30
    let timer = Timer()
    
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    
    @IBAction func slider(_ sender: UISlider)
    {
        seconds = Int(sender.value)
        label.text = String(seconds) + " seconds"
        
    }
    
    
    @IBOutlet weak var startOutlet: UIButton!
    
    @IBAction func start(_ sender: Any)
    {
        let timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerMain.counter), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
        
       
        
    }
    @objc func counter()
    {
        seconds -= 1
        label.text = String(seconds) + " seconds"
        
        if (seconds == 0)
        {
            timer.invalidate()
            
            sliderOutlet.isHidden = false
            startOutlet.isHidden = false
        }
    }
    
    
    @IBOutlet weak var stopOutlet: UIButton!
    
    @IBAction func stop(_ sender: Any)
    {
        timer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        label.text = "30 seconds"
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
}

