//
//  CurrencyTablViewCell.swift
//  ExchangeRates
//
//  Created by Serg on 03/06/2019.
//  Copyright © 2019 Sergey Gladkiy. All rights reserved.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {
    private weak var currencyDescription: UILabel!
    
    weak var viewModel: CurrencyCellViewModel? {
        didSet {
            currencyDescription.text = "\(viewModel!.code): \(viewModel!.description)"
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

extension CurrencyTableViewCell {
    func layoutCell() {
        let labelCurrency = AdjustingLabel()
        labelCurrency.translatesAutoresizingMaskIntoConstraints = false
        addSubview(labelCurrency)
    
        NSLayoutConstraint.activate([labelCurrency.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor), labelCurrency.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20)])
        currencyDescription = labelCurrency
    }
}
