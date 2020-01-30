//
//  ViewModelRatesScreen.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class ViewModelRatesScreen {
    
    var chosenCurrencies: Observable<[ChosenCurrencyCellViewModel]> = Observable<[ChosenCurrencyCellViewModel]>(observable: [])
    
    var occurError: Observable<String> = Observable<String>(observable: "")
    
    private weak var model: ModelRatesScreen!
    
    init(model: ModelRatesScreen) {
        self.model = model
    }
    deinit {
        print("ViewModelRatesScreen deinit")
    }
}

extension ViewModelRatesScreen: ViewModelRatesSreenProtocol {
    func removeSelectRow(atIndexPath indexPath: IndexPath) {
        chosenCurrencies.observable.remove(at: indexPath.row)
    }
}
