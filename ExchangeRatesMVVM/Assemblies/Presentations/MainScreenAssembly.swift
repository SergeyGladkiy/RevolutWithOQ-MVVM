//
//  MainScreenAssembly.swift
//  ExchangeRates
//
//  Created by Serg on 03/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Swinject

final class MainScreenAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ExchangeRatesRouterInput.self) { _ in
            CoordinatorScreenCurrencies()}.inObjectScope(.container)
        
        container.register(MainScreenCurrencies.self) { r in
            let viewModel = r.resolve(MainScreenViewModelType.self)!
            let router = r.resolve(ExchangeRatesRouterInput.self)!
            return MainScreenCurrencies(viewModel: viewModel, router: router)
        }
        
        container.register(MainScreenViewModelType.self) { r in
            let model = r.resolve(ModelMainScreen.self)!
            return ViewModelMainScreen(model: model)
        }
        
        container.register(ModelMainScreen.self) { r in
            let mapper = r.resolve(MapperMainScreenInterface.self)!
            return ModelMainScreen(mapper: mapper)
        }
        
        container.register(MapperMainScreenInterface.self) { _ in
            MapperMainScreenImplemetation()
        }
    }
}
