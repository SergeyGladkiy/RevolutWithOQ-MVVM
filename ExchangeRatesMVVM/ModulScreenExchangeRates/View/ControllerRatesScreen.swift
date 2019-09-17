//
//  ControllerRatesScreen.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation
import UIKit

class ControllerRatesScreen: UIViewController {
    
    private weak var backward: UIButton!
    private weak var tableView: UITableView!
    
    var viewModel: ViewModelRatesSreenProtocol?
    var router: ExchangeRatesRouterInput!
    
    var listOfCurrencies: [ChosenCurrencyCellViewModel] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var arrayConstraints = [NSLayoutConstraint]()
    
//    required init(viewModel: ViewModelRatesSreenType, coordinator: ExchangeRatesRouterInput) {
//        super.init(nibName: nil, bundle: nil)
//        self.viewModel = viewModel
//        self.coordinator = coordinator
//
//        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
//        layout()
//    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        view.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        layout()
    }
}

extension ControllerRatesScreen {
    func twoWayDataBinding() {
        viewModel?.chosenCurrencies.bind { array in
            self.listOfCurrencies = array
        }
        viewModel?.occurError.bind { error in
            self.occurError(error)
        }
    }
}

extension ControllerRatesScreen {
    func layout() {
        let buttonRates = RoundedButton()
        buttonRates.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonRates)
        buttonRates.setTitle("Backward", for: .normal)
        let topButtonRates = buttonRates.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
        let rightButtonRates = buttonRates.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10)
        let widthButtonRates = buttonRates.widthAnchor.constraint(greaterThanOrEqualToConstant: 110)
        arrayConstraints.append(contentsOf: [topButtonRates, rightButtonRates, widthButtonRates])
        buttonRates.addTarget(self, action: #selector(back), for: .touchUpInside)
        backward = buttonRates
        
        let listOfCurrency = UITableView()
        listOfCurrency.layer.borderWidth = 1
        listOfCurrency.layer.cornerRadius = 5
        listOfCurrency.register(ChosenCurrencyTableViewCell.self, forCellReuseIdentifier: "ChosenCurrencyTableViewCell")
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

extension ControllerRatesScreen {
    private func occurError(_ error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        
        self.present(alertController, animated: true, completion: nil)
    }
}

extension ControllerRatesScreen {
    @objc func back() {
        router.back()
        print(listOfCurrencies)
        listOfCurrencies = []
    }
}

extension ControllerRatesScreen: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChosenCurrencyTableViewCell", for: indexPath) as! ChosenCurrencyTableViewCell
        cell.viewModel = listOfCurrencies[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
            viewModel?.removeSelectRow(atIndexPath: indexPath)
    }
}
