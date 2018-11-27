//
//  SelfDrivingCar.swift
//  Classes and Objects
//
//  Created by Pentagram Research on 27/11/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import Foundation

class SelfDrivingCar : Car
{
    var destination : String?
    
    override func drive()
    {
        super.drive()
        
        if let userSetDestination = destination
        {
            print("driving towards " + userSetDestination)
        }
        else
        {
            print("Destination missing")
        }
        

    }
}
