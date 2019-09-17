//
//  Operation.swift
//  ExchangeRates
//
//  Created by Serg on 22/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class DataDownloader: Operation {
    let task: URLSessionTask
    init(_ task: URLSessionTask) {
        self.task = task
    }
    
    override func main() {
        if isCancelled {
            return
        }
        task.resume()
        //task = URLSession.shared.dataTask(with: <#T##URL#>, completionHandler: <#T##(Data?, URLResponse?, Error?) -> Void#>)
    }
    
    override var isAsynchronous: Bool {
        return true
    }
}
