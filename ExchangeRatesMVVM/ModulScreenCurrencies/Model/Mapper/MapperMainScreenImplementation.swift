//
//  MapperMainScreenImplementation.swift
//  ExchangeRates
//
//  Created by Serg on 03/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class MapperMainScreenImplemetation: MapperMainScreenInterface {
    func makeListOfCurrencies(_ dictionary: [String : String]) -> [CurrencyCellViewModel] {
        return dictionary.map { (key, value) in Currency(code: "\(key)", description: "\(value)") }
    }
}
