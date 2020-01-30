//
//  ViewController.swift
//  ExchangeRates
//
//  Created by Serg on 03/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import UIKit

class MainScreenCurrencies: UIViewController {

    private weak var showRates: UIButton!
    private weak var tableView: UITableView!
    
    private var router: ExchangeRatesRouterInput!
    private var viewModel: MainScreenViewModelType!
    
    private var chosenItems: [CurrencyCellViewModel] = []
    private var arrayOfCurrencies: [CurrencyCellViewModel] = []
    
    private var arrayConstraints = [NSLayoutConstraint]()
    
    required init(viewModel: MainScreenViewModelType, router: ExchangeRatesRouterInput) {
        
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        layout()
        
        viewModel.listOfCurrencies.bind { [unowned self] in
            self.arrayOfCurrencies = $0
            
        }
        viewModel.chosenCurrencies.bind { [weak self] in
            guard let self = self else { return }
            self.chosenItems = $0
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        layout()
    }
}

extension MainScreenCurrencies {
    func layout() {
        
        let buttonRates = RoundedButton()
        buttonRates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonRates)
        buttonRates.setTitle("Show rates", for: .normal)
        let topButtonRates = buttonRates.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        let rightButtonRates = buttonRates.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        let widthButtonRates = buttonRates.widthAnchor.constraint(greaterThanOrEqualToConstant: 110)
        arrayConstraints.append(contentsOf: [topButtonRates, rightButtonRates, widthButtonRates])
        buttonRates.addTarget(self, action: #selector(checkExchangeRates), for: .touchUpInside)
        showRates = buttonRates
        
        let listOfCurrency = UITableView()
        listOfCurrency.layer.borderWidth = 1
        listOfCurrency.layer.cornerRadius = 5
        listOfCurrency.register(CurrencyTableViewCell.self, forCellReuseIdentifier: "CurrencyTableViewCell")
        listOfCurrency.dataSource = self
        listOfCurrency.delegate = self
        listOfCurrency.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(listOfCurrency)
        let topListOfCurrency = listOfCurrency.topAnchor.constraint(equalTo: buttonRates.bottomAnchor, constant: 10)
        let leftListOfCurrency = listOfCurrency.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor)
        let rightListOfCurrency = listOfCurrency.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        let buttonListOfCurrency = listOfCurrency.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        arrayConstraints.append(contentsOf: [topListOfCurrency, leftListOfCurrency, rightListOfCurrency, buttonListOfCurrency])
        tableView = listOfCurrency
        NSLayoutConstraint.activate(arrayConstraints)
        
    }
}

extension MainScreenCurrencies {
    @objc func checkExchangeRates() {
        if chosenItems.count >= 2 {
            var chosenCodesOfCurrencies: [String] = []
            _ = chosenItems.map { item in
                chosenCodesOfCurrencies.append(item.code)
            }
            router.showExchangeRates(chosenCodesOfCurrencies)
        } else {
            let alertController = UIAlertController(title: "Error", message:
                "Mark at least 2 positions", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            
            self.present(alertController, animated: true, completion: nil)
        }
    }
}

extension MainScreenCurrencies: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayOfCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        let currency = arrayOfCurrencies[indexPath.row]
        cell.viewModel = currency
        if (currency.marked) {
            cell.accessoryType = .checkmark
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        if let cell = tableView.cellForRow(at: indexPath as IndexPath) as! CurrencyTableViewCell? {
            if arrayOfCurrencies[indexPath.row].marked == true {
                cell.accessoryType = .none
                arrayOfCurrencies[indexPath.row].marked = false
                guard let viewModel = viewModel else { return }
                viewModel.removeSelectedRow(atIndexPath: indexPath)
            } else {
                cell.accessoryType = .checkmark
                arrayOfCurrencies[indexPath.row].marked = true
                guard let viewModel = viewModel else { return }
                viewModel.appendSelectedRow(atIndexPath: indexPath)
            }
        }
    }
}
