//
//  CoordinatorScreenCurrencies.swift
//  ExchangeRates
//
//  Created by Serg on 03/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import UIKit

class CoordinatorScreenCurrencies {
    private weak var controllerScreenCurrencies: MainScreenCurrencies!

    private weak var controllerRatesScreen: ControllerRatesScreen!
    private var modelRatesScreen: ModelRatesScreen!
    
    
}

extension CoordinatorScreenCurrencies {
    func buildExchangeRatesPresenter() -> UIViewController {

        self.modelRatesScreen = DependenceProvider.resolve()
        let viewModelRatesScreen: ViewModelRatesSreenProtocol = DependenceProvider.resolve()
        self.controllerRatesScreen = DependenceProvider.resolve()
        controllerRatesScreen.router = self
        controllerRatesScreen.viewModel = viewModelRatesScreen
        
        modelRatesScreen.chosenCurrencies.bind { currencies in
            viewModelRatesScreen.chosenCurrencies.observable = currencies
        }

        modelRatesScreen.occurError.bind { (error) in
            if error == "" {
                return
            }
            viewModelRatesScreen.occurError.observable = error
        }
        controllerRatesScreen.twoWayDataBinding()
        
        return controllerRatesScreen
    }
}

extension CoordinatorScreenCurrencies: ExchangeRatesRouterInput {
    
    func start() -> UIViewController {
        self.controllerScreenCurrencies = DependenceProvider.resolve()
        return controllerScreenCurrencies
    }
    
    func showExchangeRates(_ list: [String]) {
        let viewRatesScreen = buildExchangeRatesPresenter()
        modelRatesScreen.dataForRequest(list)
        controllerScreenCurrencies.present(viewRatesScreen, animated: true)
    }
    
    func back() {
        controllerRatesScreen.dismiss(animated: true, completion: nil)
    }
}

