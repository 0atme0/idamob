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
class Loader {
    func getDaily() {
        Alamofire.request(.GET, "http://www.cbr.ru/scripts/XML_daily.asp", parameters: nil)
            .response { (request, response, data, error) in
                var xml = SWXMLHash.parse(data!)
                print(xml)
        }
   
    }


}

