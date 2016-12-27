//
//  Database.swift
//  IdaTestTask
//
//  Created by Andrey Ildyakov on 27.12.16.
//  Copyright © 2016 Andrey Ildyakov. All rights reserved.
//

import Foundation
import RealmSwift

class ValuteDB: Object{
    dynamic var id: String = ""
    dynamic var name: String = ""
    dynamic var nominal: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }
}
