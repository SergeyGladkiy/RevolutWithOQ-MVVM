//
//  ApplicationRouterAssembly.swift
//  ExchangeRates
//
//  Created by Serg on 03/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Swinject

class ApplicationRouterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(AppCoordinator.self) { _ in AppCoordinator() }.inObjectScope(.container)
    }
}
