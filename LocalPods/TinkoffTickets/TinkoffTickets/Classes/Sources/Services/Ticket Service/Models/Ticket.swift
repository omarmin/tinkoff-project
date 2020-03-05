//
//  Ticket.swift
//  Pods-TinkoffProject
//
//  Created by Omar on 04.03.2020.
//

import Foundation

struct Ticket {
    let symbol: String
    let displaySymbol: String
    let description: String
}

extension Ticket: Decodable {
    
}
