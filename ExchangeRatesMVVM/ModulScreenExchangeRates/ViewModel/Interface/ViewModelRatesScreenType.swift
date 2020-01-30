//
//  ViewModelRatesScreenType.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

protocol ViewModelRatesSreenProtocol: class {
    var chosenCurrencies: Observable<[ChosenCurrencyCellViewModel]> { get set }
    var occurError: Observable<String> { get set }
    func removeSelectRow(atIndexPath indexPath: IndexPath)
}
