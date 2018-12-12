//
//  Item.swift
//  15_ToDoey
//
//  Created by Pentagram Research on 11/12/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import Foundation
import RealmSwift

class Item : Object
{
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
