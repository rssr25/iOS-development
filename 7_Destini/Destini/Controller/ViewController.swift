//
//  ViewController.swift
//  Destini
//
//  Created by Philipp Muellauer on 01/09/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // UI Elements linked to the storyboard
    @IBOutlet weak var topButton: UIButton!         // Has TAG = 1
    @IBOutlet weak var bottomButton: UIButton!      // Has TAG = 2
    @IBOutlet weak var storyTextView: UILabel!
    @IBOutlet weak var restartButton: UIButton!
    
    //properties
    var storyNumber : Int = 0
    let allStories = StoryBank()
    
    // TODO Step 5: Initialise instance variables here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // TODO Step 3: Set the text for the storyTextView, topButton, bottomButton, and to T1_Story, T1_Ans1, and T1_Ans2
        nextStory()
    }

    
    // User presses one of the buttons
    @IBAction func buttonPressed(_ sender: UIButton) {
    
        // TODO Step 4: Write an IF-Statement to update the views
        print(storyNumber)
        
        
        
        if sender.tag == 1 && storyNumber == 0
        {
            storyNumber = 2
            nextStory()
        }
        else if sender.tag == 2 && storyNumber == 0
        {
            storyNumber = 1
            nextStory()
        }
        else if sender.tag == 1 && storyNumber == 1
        {
            storyNumber = 2
            nextStory()
        }
        else if sender.tag == 2 && storyNumber == 1
        {
            storyNumber = 3
            nextStory()
        }
        else if sender.tag == 1 && storyNumber == 2
        {
            storyNumber = 5
            nextStory()
        }
        else if sender.tag == 2 && storyNumber == 2
        {
            storyNumber = 4
            nextStory()
        }
        // TODO Step 6: Modify the IF-Statement to complete the story
        if(storyNumber == 3 || storyNumber == 4 || storyNumber == 5)
        {
            topButton.isHidden = true;
            bottomButton.isHidden = true;
            restartButton.isHidden = false;
            
            
        }
    }
    
    func nextStory()
    {

        storyTextView.text = allStories.list[storyNumber].chapterText
        topButton.setTitle(allStories.list[storyNumber].answerA, for: .normal)
        bottomButton.setTitle(allStories.list[storyNumber].answerB, for: .normal)
        
    
    }
    
    
    @IBAction func restartPressed(_ sender: UIButton)
    {
        storyNumber = 0
        topButton.isHidden = false;
        bottomButton.isHidden = false;
        restartButton.isHidden = true;
        nextStory()
    }
}

