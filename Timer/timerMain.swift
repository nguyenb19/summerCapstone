//
//  timerMain.swift
//  FitnessApp
//
//  Created by Jake Nguyen on 5/20/19.
//  Copyright © 2019 Jake Nguyen. All rights reserved.
//


import Foundation
import UIKit
import AVFoundation

class timerMain: UIViewController {
    
    var seconds = 30
    var timer = Timer()
    var audioPlayer = AVAudioPlayer()
    var setTime = 30
    
    
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
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerMain.counter), userInfo: nil, repeats: false)
        
        setTime = Int(sliderOutlet.value)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
        
       
        
    }
    @objc func counter()
    {
        seconds -= 1
        label.text = String(seconds) + " seconds"
        
        if (seconds == 0)
        {
            //timer.invalidate()//means redraw
            
            //sliderOutlet.isHidden = false
            //startOutlet.isHidden = false
            
            audioPlayer.play()
            actualStop()
        }
        else{
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerMain.counter), userInfo: nil, repeats: false)
        }
    }
    
    func actualStop()
    {
        timer.invalidate()
        seconds = setTime
        sliderOutlet.setValue(Float(setTime), animated: true)
        label.text = String(setTime) + " seconds"
        
        //audioPlayer.stop()
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    
    @IBOutlet weak var stopOutlet: UIButton!
    
    @IBAction func stop(_ sender: Any)
    {
        actualStop()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do
        {
            let audioPath = Bundle.main.path(forResource: "Alarm1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch
        {
            //ERORR
        }
    }
    
    
}

