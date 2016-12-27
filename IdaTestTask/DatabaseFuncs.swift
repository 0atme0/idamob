//
//  DatabaseFuncs.swift
//  IdaTestTask
//
//  Created by Andrey Ildyakov on 27.12.16.
//  Copyright © 2016 Andrey Ildyakov. All rights reserved.
//

import Foundation
import RealmSwift

class DbLoad {
    func count() {
        let realm = try! Realm()
        let total: Int = realm.objects(ValuteDB).count
        print(total)
    }
    
    
}
