//
//  AppDelegate.swift
//  15_ToDoey
//
//  Created by Pentagram Research on 04/12/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import UIKit
import CoreData
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
        do
        {
            _ = try Realm()

        }
        catch
        {
            print("Error initializing new realm: \(error)")
        }
        
        
        return true
    }





}

