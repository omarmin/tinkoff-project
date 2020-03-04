//
//  Endpoint+Extension.swift
//  Pods-TinkoffProject
//
//  Created by Omar on 04.03.2020.
//

import Foundation
import TinkoffNetwork

extension Endpoint {
    static var baseUrl: URL {
        return URL(string: "https://finnhub.io/api/")!
    }
}
