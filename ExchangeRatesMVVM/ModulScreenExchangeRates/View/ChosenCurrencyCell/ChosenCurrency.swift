//
//  ChosenCurrency.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class ChosenCurrency: ChosenCurrencyCellViewModel {
    var pair: String
    var rate: String
    init(pair: String, rate: String) {
        self.pair = pair
        self.rate = rate
    }
}
