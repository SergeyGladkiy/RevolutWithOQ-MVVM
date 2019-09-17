//
//  MapperRatesScreenModelIterface.swift
//  ExchangeRates
//
//  Created by Serg on 03/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

protocol MapperRatesSreenModelInterface {
    func makeStringForUrl(_ list: [String]) -> String
    func makeChosenCurrencyFromDataNetwork(_ array: [String: Float]) -> [ChosenCurrencyCellViewModel]
}

