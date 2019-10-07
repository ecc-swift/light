//
//  ViewController.swift
//  Light
//
//  Created by Chun on 2019/10/7.
//  Copyright © 2019 Nemoworks. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    var lightOn = true
    
    var isTorch = false
    
    
    @IBAction func buttonTapped(){
        
        if lightOn {
            self.view.backgroundColor = .black
            lightOn = false
        }else{
            self.view.backgroundColor = .white
            lightOn = true
        }
        
        
        guard let device = AVCaptureDevice.default(for: AVMediaType.video) else { return }

        

        if device.hasTorch {

            isTorch = !isTorch

            do {

                try device.lockForConfiguration()

                

                if isTorch == true {

                    device.torchMode = .on

                } else {

                    device.torchMode = .off

                }

                

                device.unlockForConfiguration()

            } catch {

                print("Torch is not working.")

            }

        } else {

            print("Torch not compatible with device.")

        }
        
    }

}

