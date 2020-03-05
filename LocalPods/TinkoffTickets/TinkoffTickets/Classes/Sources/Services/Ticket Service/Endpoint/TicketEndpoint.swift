//
//  TicketEndpoint.swift
//  Pods-TinkoffProject
//
//  Created by Omar on 04.03.2020.
//

import Foundation
import TinkoffNetwork

enum TicketEndpoint: Endpoint {
    case tickets
    
    var path: String {
        switch self {
        case .tickets:
            return "v1/stock/symbol"
        }
    }
}
