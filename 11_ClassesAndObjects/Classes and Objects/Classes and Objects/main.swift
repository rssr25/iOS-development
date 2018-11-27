//
//  main.swift
//  Classes and Objects
//
//  Created by Pentagram Research on 27/11/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import Foundation

let myCar = Car(_numberOfSeats: 4)
let someRichGuysCar = Car(customerChosenColor: "Gold")
let mySelfDrivingCar = SelfDrivingCar()
mySelfDrivingCar.drive()
print(mySelfDrivingCar.color)
