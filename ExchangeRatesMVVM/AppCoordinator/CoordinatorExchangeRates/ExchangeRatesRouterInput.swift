//
//  ExchangeRatesRouterInput.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation
import UIKit

protocol ExchangeRatesRouterInput: class {
    func showExchangeRates(_ list: [String])
    func back()
    func start() -> UIViewController
}
