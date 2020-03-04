//
//  ManagedObjectConvertible.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 03/03/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import CoreData

protocol ManagedObjectConvertible {
    associatedtype ManagedObject: NSManagedObject, ManagedObjectProtocol
    func toManagedObject(in context: NSManagedObjectContext) -> ManagedObject?
}
