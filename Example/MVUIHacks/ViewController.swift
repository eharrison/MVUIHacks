//
//  ViewController.swift
//  MVUIHacks
//
//  Created by Evandro Harrison Hoffmann on 09/09/2016.
//  Copyright (c) 2016 Evandro Harrison Hoffmann. All rights reserved.
//

import UIKit
import MVUIHacks

class ViewController: UIViewController {

    @IBOutlet weak var hexagonView: DesignableView!
    @IBOutlet weak var circleView: DesignableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        hexagonView.animateShowPopingUp()
        circleView.animateShowPopingUp()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        sender.animateTouchDown{
            self.circleView.animateFadeInUp()
            self.hexagonView.animateFadeInUp()
        }
    }
    
    @IBAction func pressAndHoldPressed(_ sender: UIButton) {
        sender.animateTouchDown(autoAnimateUp: false, halfWay: {
            self.circleView.animateFadeOut()
            self.hexagonView.animateFadeOut()
        })
    }
    
    @IBAction func pressAndHoldReleased(_ sender: UIButton) {
        sender.animateTouchUp{
            self.circleView.animateFadeIn()
            self.hexagonView.animateFadeIn()
        }
    }
    
}

