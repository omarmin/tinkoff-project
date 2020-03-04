//
//  Ticker+CoreDataClass.swift
//  
//
//  Created by Gennady Stepanov on 29/02/2020.
//
//

import Foundation
import CoreData

@objc(Ticker)
public class Ticker: NSManagedObject {}

extension Ticker: ManagedObjectProtocol {
    func toEntity() -> TickerData? {
        return TickerData(description: tickerDescription,
                          symbol: symbol,
                          displaySymbol: displaySymbol)
    }
}

extension TickerData: ManagedObjectConvertible {
    func toManagedObject(in context: NSManagedObjectContext) -> Ticker? {
        let ticker = Ticker.getOrCreateSingle(withKeyPath: "symbol", withID: symbol, from: context)
        ticker.displaySymbol = displaySymbol
        ticker.tickerDescription = description
        return ticker
    }
}
