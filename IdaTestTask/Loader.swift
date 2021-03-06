//
//  Loader.swift
//  IdaTestTask
//
//  Created by Andrey Ildyakov on 27.12.16.
//  Copyright © 2016 Andrey Ildyakov. All rights reserved.
//

import Foundation
import Alamofire
import SWXMLHash
import RealmSwift
//Load data, parse and save to db
class Loader {
    func getDaily(completion:(Bool)->()) {
        let urlString = "http://www.cbr.ru/scripts/XML_daily.asp"

        Alamofire.request(.GET, urlString, parameters: nil)
            .response { (request, response, data, error) in
                
                var xml = SWXMLHash.parse(data!)
                print(xml)
                for value in xml["ValCurs"]["Valute"] {
                    let newItem = ValuteDB()
                    if let code = value["NumCode"].element?.text {
                        newItem.id = code
                    }
                    if let name = value["Name"].element?.text {
                        newItem.name = name
                    }
                    if let nominal = value["Value"].element?.text {
                        newItem.nominal = nominal
                    }
                    let realm = try! Realm()
                    try! realm.write {
                        realm.add(newItem, update: true)
                    }
                }

                if response != nil {
                    completion(true)
                } else {
                    completion(false)
                }
        }
    }


}

