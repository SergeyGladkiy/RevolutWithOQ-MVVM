//
//  ViewModelMainScreen.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class ViewModelMainScreen {
    var listOfCurrencies: Observable<[CurrencyCellViewModel]> = Observable<[CurrencyCellViewModel]>(observable: [CurrencyCellViewModel]())
    
    var chosenCurrencies: Observable<[CurrencyCellViewModel]> = Observable<[CurrencyCellViewModel]>(observable: [])
    
    private let model: ModelMainScreen
    init(model: ModelMainScreen) {
        self.model = model
        model.parseDataFromJson()
        self.listOfCurrencies.observable = model.getListCurrencies()
    }
}

extension ViewModelMainScreen: MainScreenViewModelType {
    func removeSelectedRow(atIndexPath indexPath: IndexPath) {
        let item = listOfCurrencies.observable[indexPath.row].code
        for i in 0..<chosenCurrencies.observable.count {
            if chosenCurrencies.observable[i].code == item {
                chosenCurrencies.observable.remove(at: i)
                return
            }
        }
    }
    
    func appendSelectedRow(atIndexPath indexPath: IndexPath) { chosenCurrencies.observable.append(listOfCurrencies.observable[indexPath.row])
    }
}
    
