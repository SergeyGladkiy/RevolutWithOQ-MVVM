//
//  ModelRatesScreen.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation

class ModelRatesScreen {
    private let mapper: MapperRatesSreenModelInterface
    private let networking: NetworkingInput
    
    //let timerData: DispatchSourceTimer!
    
    var chosenCurrencies: Observable<[ChosenCurrencyCellViewModel]> = Observable<[ChosenCurrencyCellViewModel]>(observable: [])
    
    var occurError: Observable<String> = Observable<String>(observable: "")
    
    init(mapper: MapperRatesSreenModelInterface, networking: NetworkingInput) {
        self.mapper = mapper
        self.networking = networking
//        let queue = DispatchQueue(label: "queueForDispatchSource", attributes: .concurrent)
//        let timer = DispatchSource.makeTimerSource(queue: queue)
//        timer.schedule(deadline: .now(), repeating: .seconds(5), leeway: .milliseconds(300))
//        self.timerData = timer
    }
    
    deinit {
        print("modelRatesScreen deinit")
    }
}

let dictionary = ["AUD": "Australian Dollar",
                  "BGN": "Bulgarian Lev",
                  "BRL": "Brazil Real",
                  "CAD": "Canadian Dollar",
                  "CHF": "Swiss Franc",
                  "CNY": "Yuan Renminbi",
                  "CZK": "Czech Koruna",
                  "DKK": "Danish Krone",
                  "EUR": "European Currency Unit",
                  "GBP": "Pound Sterling",
                  "HKD": "Hong Kong Dollar",
                  "HRK": "Croatian Kuna",
                  "HUF": "Forint",
                  "IDR": "Indonesian Rupiah",
                  "ILS": "New Israeli Sheqel",
                  "INR": "Indian Rupee",
                  "ISK": "Iceland Krona",
                  "JPY": "Yen",
                  "KRW": "South Korean Won",
                  "MXN": "Mexican Peso",
                  "MYR": "Malaysian Ringgit",
                  "NOK": "Norwegian Krone",
                  "NZD": "New Zealand Dollar",
                  "PHP": "Philippine Peso",
                  "PLN": "Poland Zloty",
                  "RON": "Romanian Leu",
                  "RUB": "Russian Ruble",
                  "SEK": "Swedish Krona",
                  "SGD": "Singapore Dollar",
                  "THB": "Thai Baht",
                  "USD": "US Dollar",
                  "ZAR": "South African Rand"]



extension ModelRatesScreen {
    func dataForRequest(_ list: [String]) {
        
        let string = mapper.makeStringForUrl(list)
        //print(string)
        self.networking.getExchangeRates(string) { [unowned self] (response) in
            switch response {
            case .success(let pairs):
                self.chosenCurrencies.observable = self.mapper.makeChosenCurrencyFromDataNetwork(pairs)

            case .failure(let error):
                self.occurError.observable = error.message
            }
        }
        
        
//        var arrayForOperation = [String]()
//        let arrayCurrency = [String](dictionary.keys)
//        for (item, value) in arrayCurrency.enumerated() {
//            if item % 2 == 0 {
//                let str = "pairs=\(value)\(arrayCurrency[item+1])&pairs=\(arrayCurrency[item+1])\(value)"
//                arrayForOperation.append(str)
//            }
//        }
//
//
//        let time = duration {
//            _ = arrayForOperation.map {
//                self.counter += 1
//                print("element \(counter) \($0) \n")
//
//                self.networking.getExchangeRates($0) { [unowned self] (response) in
//                    switch response {
//                    case .success(let pairs):
//                        self.chosenCurrencies.observable = self.mapper.makeChosenCurrencyFromDataNetwork(pairs)
//
//                        print("pairs \(self.chosenCurrencies.observable[0].pair) and \(self.chosenCurrencies.observable[1].pair) rates \(self.chosenCurrencies.observable[0].rate) \(self.chosenCurrencies.observable[1].rate)")
//
//                    case .failure(let error):
//                        self.occurError.observable = error.message
//                    }
//                }
//            }
//        }
//
//        print(time)
        
        
//        timerData.setEventHandler { [unowned self] in
//            self.chosenCurrencies.observable = []
//            self.counter += 1
//            print(self.counter)
//            self.networking.getExchangeRates(string) { [unowned self] (response) in
//                switch response {
//                case .success(let pairs):
//                    self.chosenCurrencies.observable = self.mapper.makeChosenCurrencyFromDataNetwork(pairs)
//
//                case .failure(let error):
//                    self.occurError.observable = error.message
//                }
//            }
//        }
//        timerData.resume()
    }
}


