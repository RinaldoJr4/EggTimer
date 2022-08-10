//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let softTime = 300
    let mediumTime = 420
    let hardTime = 720
    var timer = Timer()
    var tempo: Int = 0
    var tempoPorcent: Float = 0
    
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var titleLabel: UILabel!
    @IBAction func hardnessSelect(_ sender: UIButton) {
        let dureza = sender.titleLabel?.text ?? ""
        timer.invalidate()
        if dureza == "Soft"{
            tempo = softTime
            tempoPorcent = Float(softTime)
        } else if dureza == "Medium"{
            tempo = mediumTime
            tempoPorcent = Float(mediumTime)
        } else {
            tempo = hardTime
            tempoPorcent = Float(hardTime)
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    
    @objc func updateTimer() {
        if(tempo >= 0) {
            progressBar.progress = 1 - (Float(tempo)/tempoPorcent)
            progressBar.isHidden = false
            titleLabel.text = "Your egg will be ready in \(tempo) seconds"
            tempo -= 1
        } else {
            progressBar.isHidden = true
            timer.invalidate()
            titleLabel.text = "Done!"
        }
    }
}
