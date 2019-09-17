//
//  EntityScreenCurrencies.swift
//  ExchangeRates
//
//  Created by Serg on 03/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class ModelMainScreen {
    
    private var mapperModelMainScreen: MapperMainScreenInterface
    
    var dictionaryCurrencies = ["AUD": "Australian Dollar",
                                "BGN": "Bulgarian Lev",
                                "BRL": "Brazil Real",
                                "CAD": "Canadian Dollar",
                                "CHF": "Swiss Franc",
                                "CNY": "Yuan Renminbi",
                                "CZK": "Czech Koruna",
                                "DKK": "Danish Krone",
                                "EUR": "European Currency Unit",
                                "GBP": "Pound Sterling",
                                "HKD": "Hong Kong Dollar",
                                "HRK": "Croatian Kuna",
                                "HUF": "Forint",
                                "IDR": "Indonesian Rupiah",
                                "ILS": "New Israeli Sheqel",
                                "INR": "Indian Rupee",
                                "ISK": "Iceland Krona",
                                "JPY": "Yen",
                                "KRW": "South Korean Won",
                                "MXN": "Mexican Peso",
                                "MYR": "Malaysian Ringgit",
                                "NOK": "Norwegian Krone",
                                "NZD": "New Zealand Dollar",
                                "PHP": "Philippine Peso",
                                "PLN": "Poland Zloty",
                                "RON": "Romanian Leu",
                                "RUB": "Russian Ruble",
                                "SEK": "Swedish Krona",
                                "SGD": "Singapore Dollar",
                                "THB": "Thai Baht",
                                "USD": "US Dollar",
                                "ZAR": "South African Rand"]
    
    init(mapper: MapperMainScreenInterface) {
        self.mapperModelMainScreen = mapper
    }
}

extension ModelMainScreen {
    func getListCurrencies() -> [CurrencyCellViewModel] {
        return mapperModelMainScreen.makeListOfCurrencies(dictionaryCurrencies)
    }
}
