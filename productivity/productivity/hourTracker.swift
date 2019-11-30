//
//  hourTracker.swift
//  productivity
//
//  Created by Mo Syed on 11/20/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import Foundation
import RealmSwift

class hourTracker: Object {
    
    @objc dynamic var productiveHours: Double = 0.0
    
    @objc dynamic var sleepHours: Double = 0.0
    @objc dynamic var commuteHours: Double = 0.0
    @objc dynamic var foodHours: Double = 0.0
    
    
    @objc dynamic var goal1: String?
    @objc dynamic var hours1: Double = 0.0
    @objc dynamic var goal1completed: Double = 0.0

    
    
    @objc dynamic var goal2: String?
    @objc dynamic var hours2: Double = 0.0
    @objc dynamic var goal2completed: Double = 0.0


    @objc dynamic var goal3: String?
    @objc dynamic var hours3: Double = 0.0
    @objc dynamic var goal3completed: Double = 0.0


    @objc dynamic var goal4: String?
    @objc dynamic var hours4: Double = 0.0
    @objc dynamic var goal4completed: Double = 0.0


    @objc dynamic var goal5: String?
    @objc dynamic var hours5: Double = 0.0
    @objc dynamic var goal5completed: Double = 0.0

    
}





