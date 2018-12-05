import UIKit

let defaults = UserDefaults.standard

defaults.set(0.24, forKey: "Volume")
defaults.set(true, forKey: "MusicOn")
defaults.set("Angela", forKey: "PlayerName")
defaults.set(Date(), forKey: "AppLastOpenedByUser")

let array = [1, 2, 3]
defaults.set(array, forKey: "myArray")
let dictionary = ["name" : "rahul"]
defaults.set(dictionary, forKey: "myDictionary")

let appLastOpen = defaults.object(forKey: "AppLastOpenedByUser")

//SINGLETONS
let defaults1 = UserDefaults.standard
let sharedURLSession = URLSession.shared
