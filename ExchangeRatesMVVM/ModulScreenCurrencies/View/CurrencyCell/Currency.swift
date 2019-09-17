//
//  Interface.swift
//  ExchangeRates
//
//  Created by Serg on 03/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class Currency: CurrencyCellViewModel {
    var description: String
    var code: String
    var marked: Bool = false
    
    init(code: String, description: String) {
        self.code = code
        self.description = description
    }
}
