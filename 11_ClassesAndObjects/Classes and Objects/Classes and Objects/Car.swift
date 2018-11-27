//
//  Car.swift
//  Classes and Objects
//
//  Created by Pentagram Research on 27/11/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import Foundation

enum CarType
{
    case Sedan
    case Coupe
    case Hatchback
}

class Car
{
    var color = "Black"
    var numberOfSeats = 5
    var typeOfCar : CarType = .Coupe
    
    init()
    {
        
    }
    
    init(_numberOfSeats : Int)
    {
        numberOfSeats = _numberOfSeats
    }
    
    convenience init(customerChosenColor : String)
    {
        self.init()
        color = customerChosenColor
    }
    
    func drive()
    {
        print("Car is moving.")
    }
    
}
