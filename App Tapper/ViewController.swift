//
//  ViewController.swift
//  App Tapper
//
//  Created by Felix Barros on 11/27/15.
//  Copyright © 2015 Bits That Matter. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var gameTitleImage: UIImageView!
    @IBOutlet weak var tapGoalTextField: UITextField!
    @IBOutlet weak var tapOutputLabel: UILabel!
    @IBOutlet weak var tapButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonTapped(sender: AnyObject) {
        showPlayControls(true)
    }
    
    // MARK: Helper functions
    func showPlayControls(displayGameControls: Bool) {
        playButton.hidden = displayGameControls
        gameTitleImage.hidden = displayGameControls
        tapGoalTextField.hidden = displayGameControls
        tapOutputLabel.hidden = !displayGameControls
        tapButton.hidden = !displayGameControls
    }

}

