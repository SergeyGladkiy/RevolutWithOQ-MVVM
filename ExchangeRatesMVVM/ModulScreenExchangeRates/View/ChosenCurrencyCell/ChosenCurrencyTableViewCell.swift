//
//  ChosenCurrencyTableViewCell.swift
//  ExchangeRates
//
//  Created by Serg on 27/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import Foundation
import UIKit

class ChosenCurrencyTableViewCell: UITableViewCell {
    private weak var currencyPair: UILabel!
    private weak var currencyRate: UILabel!
    weak var activityIndicator: UIActivityIndicatorView!
    
    weak var viewModel: ChosenCurrencyCellViewModel? {
        didSet {
            currencyPair.text = "\(viewModel!.pair)"
            currencyRate.text = "\(viewModel!.rate)"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layoutCell()
    }
    
    
}

extension ChosenCurrencyTableViewCell {
    func layoutCell() {
        let labelPair = AdjustingLabel()
        labelPair.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelPair)
        
        let labelRate = AdjustingLabel()
        labelRate.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelRate)
        
//        let activityView = UIActivityIndicatorView()
//        activityView.hidesWhenStopped = true
//        activityView.translatesAutoresizingMaskIntoConstraints = false
//        activityView.startAnimating()
//        addSubview(activityView)
        
        NSLayoutConstraint.activate(
            [labelPair.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
             labelPair.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
             labelRate.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
             labelRate.leadingAnchor.constraint(equalTo: labelPair.trailingAnchor, constant: 40),
             /*activityView.centerYAnchor.constraint(equalTo: labelRate.centerYAnchor),
             activityView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.centerXAnchor, constant: 10)*/])
        currencyPair = labelPair
        currencyRate = labelRate
        //activityIndicator = activityView
    }
}
