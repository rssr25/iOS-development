//
//  Category.swift
//  15_ToDoey
//
//  Created by Pentagram Research on 11/12/18.
//  Copyright © 2018 Rahul Sharma. All rights reserved.
//

import Foundation
import RealmSwift

class Category : Object
{
    @objc dynamic var name : String = ""
    let items = List<Item>()
}
