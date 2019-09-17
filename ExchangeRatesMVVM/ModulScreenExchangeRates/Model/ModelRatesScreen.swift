//
//  ModelRatesScreen.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class ModelRatesScreen {
    private let mapper: MapperRatesSreenModelInterface
    private let networking: NetworkingInput
    
    var chosenCurrencies: Observable<[ChosenCurrencyCellViewModel]> = Observable<[ChosenCurrencyCellViewModel]>(observable: [])
    
    var occurError: Observable<String> = Observable<String>(observable: "")
    
    init(mapper: MapperRatesSreenModelInterface, networking: NetworkingInput) {
        self.mapper = mapper
        self.networking = networking
    }
}

extension ModelRatesScreen {
    func dataForRequest(_ list: [String]) {
        let string = mapper.makeStringForUrl(list)
        print(string)
        networking.getExchangeRates(string) { (response) in
            switch response {
            case .success(let pairs):
                self.chosenCurrencies.observable = self.mapper.makeChosenCurrencyFromDataNetwork(pairs)
            case .failure(let error):
                self.occurError.observable = error.message
            }
        }
    }
}


