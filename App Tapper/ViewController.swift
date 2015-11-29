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
    
    var enteredTapGoal: Int {
        get {
            if let goalText = tapGoalTextField.text, goal = Int(goalText) {
                return goal
            } else {
                return 0
            }
        }
    }
    
    var goalTaps: Int = 0
    var currentTaps: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func playButtonTapped(sender: AnyObject) {
        if enteredTapGoal > 0 {
            showPlayControls(true)
            currentTaps = 0
            goalTaps = enteredTapGoal
        }
    }
    
    @IBAction func tapButtonTapped(sender: AnyObject) {
        currentTaps++
        updateTapOutputLabel()
        
        if gameIsOver() {
            resetGame()
        }
    }
    
    // MARK: Helper functions
    func gameIsOver() -> Bool {
        return (currentTaps >= enteredTapGoal)
    }
    
    func resetGame() {
        currentTaps = 0
        goalTaps = 0
        tapGoalTextField.text = ""
        showPlayControls(false)
    }
    
    func showPlayControls(displayGameControls: Bool) {
        playButton.hidden = displayGameControls
        gameTitleImage.hidden = displayGameControls
        tapGoalTextField.hidden = displayGameControls
        tapOutputLabel.hidden = !displayGameControls
        tapButton.hidden = !displayGameControls
    }
    
    func updateTapOutputLabel() {
        // Pluralize the text
        let pluralEnd = (currentTaps == 1 ? "" : "s")
        let tapOutputString = "\(currentTaps) Tap\(pluralEnd)"
        
        tapOutputLabel.text = tapOutputString
    }

}

