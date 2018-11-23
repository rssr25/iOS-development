//
//  Story.swift
//  Destini
//
//  Created by Pentagram Research on 23/11/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

//this is my model
import Foundation

class Story
{
    var chapterText : String
    var answerA : String
    var answerB : String
    
    init(text : String, answer1 : String, answer2 : String)
    {
        chapterText = text
        answerA = answer1
        answerB = answer2
        
    }
    
}
