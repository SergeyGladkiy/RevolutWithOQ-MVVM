//
//  AppCoordinator.swift
//  ExchangeRates
//
//  Created by Serg on 03/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import UIKit

class AppCoordinator {
    var window: UIWindow?
    var rootCoordinator: ExchangeRatesRouterInput?
}

extension AppCoordinator: Coordinator {
    func start() -> UIWindow? {
        rootCoordinator = DependenceProvider.resolve()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootCoordinator!.start()
        window?.makeKeyAndVisible()
        return window
    }
}
