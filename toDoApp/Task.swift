//
//  Task.swift
//  toDoApp
//
//  Created by Cosmin Daniel Nedelea on 08/04/2017.
//  Copyright © 2017 Cosmin Daniel Nedelea. All rights reserved.

import UIKit

class Task: NSObject {
    var titleOfTask: String
    var descriptionOfTask: String
    
    init(title: String, description: String) {
        self.titleOfTask = title
        self.descriptionOfTask = description
    }
    

}
