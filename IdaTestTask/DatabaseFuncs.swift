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
    
    func loadDataFromDb(completion:([Valute])->()) {
        var arrayValute : [Valute]  = []
        let realm = try! Realm()
        for vol in realm.objects(ValuteDB) {
            let valute = Valute()
            valute.id = vol.id
            valute.name = vol.name
            valute.nominal = vol.nominal
            arrayValute.append(valute)
        }
        completion(arrayValute)
    }
    
    
}
