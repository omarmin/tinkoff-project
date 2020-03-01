//
//  Ticker+CoreDataProperties.swift
//  
//
//  Created by Gennady Stepanov on 29/02/2020.
//
//

import Foundation
import CoreData

extension Ticker {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Ticker> {
        return NSFetchRequest<Ticker>(entityName: "Ticker")
    }

    @NSManaged public var tickerDescription: String?
    @NSManaged public var symbol: String
    @NSManaged public var displaySymbol: String?

}
