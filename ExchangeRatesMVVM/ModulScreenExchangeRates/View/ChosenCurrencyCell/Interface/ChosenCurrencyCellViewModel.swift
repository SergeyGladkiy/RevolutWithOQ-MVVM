//
//  ChosenCurrencyCellViewModel.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

protocol ChosenCurrencyCellViewModel: class {
    var pair: String { get }
    var rate: String { get }
}



