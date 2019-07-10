//
//  times.swift
//  AudioTime
//
//  Created by Mo Syed on 6/30/19.
//  Copyright © 2019 Mo Syed. All rights reserved.
//

import Foundation
import RealmSwift

class times: Object {
    @objc dynamic var times_connceted: String?
    @objc dynamic var device_name: String?
    @objc dynamic var times_discon: String?

}
