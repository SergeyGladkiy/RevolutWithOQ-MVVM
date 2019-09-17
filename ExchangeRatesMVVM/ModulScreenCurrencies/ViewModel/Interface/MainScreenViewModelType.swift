//
//  MainScreenViewModelType.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

protocol MainScreenViewModelType: class {
    var listOfCurrencies: Observable<[CurrencyCellViewModel]> { get set }
    var chosenCurrencies: Observable<[CurrencyCellViewModel]> { get set }
    func removeSelectedRow(atIndexPath indexPath: IndexPath)
    func appendSelectedRow(atIndexPath indexPath: IndexPath) 
}
