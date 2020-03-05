//
//  TicketCell.swift
//  TinkoffTickets
//
//  Created by Omar on 05.03.2020.
//

import UIKit

class TicketCell: UITableViewCell {
    
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    func setup(with viewModel: TicketCellViewModel) {
        symbolLabel.text = viewModel.displaySymbol
        descriptionLabel.text = viewModel.description
    }
}
