//
//  DependenceProvider.swift
//  ExchangeRates
//
//  Created by Serg on 06/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation
import Swinject

class DependenceProvider {
    private static let assembler = Assembler([ApplicationRouterAssembly(),
                                              MainScreenAssembly(),
                                              RatesScreenAssembly(),
                                              NetworkingAssembly()])
    
    static func resolve<T>() -> T {
        return DependenceProvider.assembler.resolver.resolve(T.self)!
    }
}
