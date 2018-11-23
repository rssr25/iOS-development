//
//  Question.swift
//  Quizzler
//
//  Created by Pentagram Research on 23/11/18.
//  Copyright © 2018 London App Brewery. All rights reserved.
//

import Foundation

class Question
{
    //properties
    let questionText : String
    let answer : Bool
    
    //events
    init(text : String, correctAnswer : Bool)
    {
        questionText = text
        answer = correctAnswer
    }
    
}
