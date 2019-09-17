//
//  PendingOperation.swift
//  ExchangeRates
//
//  Created by Serg on 22/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class PendingOperations {
    var downloadQueue: OperationQueue = {
        var queue = OperationQueue()
        queue.maxConcurrentOperationCount = 3
        return queue
    }()
}
