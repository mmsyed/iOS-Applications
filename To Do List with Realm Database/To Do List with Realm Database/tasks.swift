//
//  tasks.swift
//  To Do List with Realm Database
//
//  Created by Mo Syed on 6/8/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import Foundation
import RealmSwift

class tasks: Object {
    @objc dynamic var task_to_do: String?
    
}
