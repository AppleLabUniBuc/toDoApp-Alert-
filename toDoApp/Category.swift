//
//  Category.swift
//  toDoApp
//
//  Created by Cosmin Daniel Nedelea on 08/04/2017.
//  Copyright © 2017 Cosmin Daniel Nedelea. All rights reserved.
//

import UIKit

class Category: NSObject {
    
    var name:String
    var tasks = Array<Task>()
    
    init(name:String) {
        self.name = name
    }
}
