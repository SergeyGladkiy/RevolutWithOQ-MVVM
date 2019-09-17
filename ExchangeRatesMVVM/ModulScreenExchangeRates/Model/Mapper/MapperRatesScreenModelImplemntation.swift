//
//  MapperRatesScreenModelImplemntation.swift
//  ExchangeRates
//
//  Created by Serg on 03/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class MapperRatesScreenModelImplementation: MapperRatesSreenModelInterface {
    func makeStringForUrl(_ list: [String]) -> String {
        var currencies = list
        var stringForUrl = ""
        
        if currencies.count % 2 == 1 {
            currencies.removeLast()
        }
        
        for i in 0..<currencies.count {
            if i == 0 {
                stringForUrl += "pairs=\(currencies[i])" + "\(currencies[i+1])" + "&pairs=\(currencies[i+1])" + "\(currencies[i])"
            } else if i % 2 == 0 && i != 0 {
                stringForUrl += "&pairs=\(currencies[i])" + "\(currencies[i+1])" + "&pairs=\(currencies[i+1])" + "\(currencies[i])"
            } else {
                continue
            }
        }
        return stringForUrl
    }
    
    func makeChosenCurrencyFromDataNetwork(_ array: [String: Float]) -> [ChosenCurrencyCellViewModel] {
        var chosenCurrency = [ChosenCurrencyCellViewModel]()
        _ = array.map { (pair) in
            chosenCurrency.append(ChosenCurrency(pair: "\(pair.key)", rate: "\(pair.value)"))
        }
        return chosenCurrency
    }
}
