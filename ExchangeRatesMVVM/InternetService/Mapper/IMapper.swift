//
//  IMapper.swift
//  ExchangeRates
//
//  Created by Serg on 10/07/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

protocol IMapper {
    func parsingError(error: NSError) -> NSURLError
}
