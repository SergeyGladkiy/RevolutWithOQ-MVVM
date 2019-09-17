//
//  CurrencyCellViewModel.swift
//  ExchangeRates
//
//  Created by Serg on 03/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

protocol CurrencyCellViewModel: class {
    var description: String { get }
    var code: String { get }
    var marked: Bool { get set }
}
