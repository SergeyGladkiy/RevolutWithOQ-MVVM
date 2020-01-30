//
//  RatesScreenAssembly.swift
//  ExchangeRates
//
//  Created by Serg on 03/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation
import Swinject

final class RatesScreenAssembly: Assembly {
    
    func assemble(container: Container) {
        
        container.register(ControllerRatesScreen.self) { _ in
            ControllerRatesScreen()
        }
        
        container.register(ViewModelRatesSreenProtocol.self) { r in
            let model = r.resolve(ModelRatesScreen.self)!
            return ViewModelRatesScreen(model: model)
        }
        
        container.register(ModelRatesScreen.self) { r in
            let mapper = r.resolve(MapperRatesSreenModelInterface.self)!
            let networking = r.resolve(NetworkingInput.self)!
            return ModelRatesScreen(mapper: mapper, networking: networking)
        }
        
        container.register(MapperRatesSreenModelInterface.self) { _ in
            MapperRatesScreenModelImplementation()
        }
    }
}
