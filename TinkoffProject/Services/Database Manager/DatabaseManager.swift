//
//  DatabaseManager.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 29/02/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation
import CoreData

class DatabaseManager {
  static let shared = DatabaseManager()
  private let modelName = "schema"
  private let tickerEntityName = "Ticker"
  private let logInfo = true
  
  private var containter: NSPersistentContainer!
  private var managedContext: NSManagedObjectContext!
  
  private init() {
    containter = NSPersistentContainer(name: modelName)
    containter.loadPersistentStores { _, error in
      if let error = error as NSError? {
        self.log(message: "[DatabaseManager:] error loading persistent stores \(error), \(error.userInfo)")
      }
    }
    managedContext = containter.viewContext
  }
  
  // MARK: - Tickers
  func createOrUpdateTicker(tickerData: TickerData) {
    if let savedTicker = readTickerWithSymbol(symbol: tickerData.symbol) {
        managedContext.delete(savedTicker)
    }
    makeTickerWithTickerData(data: tickerData, in: managedContext)
    saveContext()
  }
  
  func readTickerWithSymbol(symbol: String) -> Ticker? {
    var result: Ticker?
    let fetch = NSFetchRequest<Ticker>(entityName: tickerEntityName)
    fetch.predicate = NSPredicate(format: "%K == %@", #keyPath(Ticker.symbol), symbol)
    
    do {
      let results = try managedContext.fetch(fetch)
      result = results.first
      
    } catch let error as NSError {
      log(message: "[DatabaseManager:] Fetch error: \(error) description: \(error.userInfo)")
    }
    return result
  }
    
  func deleteTickerWithSymbol(symbol: String) {
    if let ticker = readTickerWithSymbol(symbol: symbol) {
      managedContext.delete(ticker)
      saveContext()
    }
  }
  
  func readAllTickers() -> [Ticker]? {
    var result: [Ticker] = []
    let fetchRequest = NSFetchRequest<Ticker>(entityName: tickerEntityName)
    
    do {
      result = try managedContext.fetch(fetchRequest)
    } catch let error as NSError {
      log(message: "[DatabaseManager:] Fetch error: \(error) description: \(error.userInfo)")
    }
    return result
  }
  
  func deleteAllTickers() {
    let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: tickerEntityName)
    let deleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
    
    do {
      try managedContext.execute(deleteRequest)
      try managedContext.save()
    } catch let error as NSError {
      log(message: "[DatabaseManager:] Fetching error: \(error), \(error.userInfo)")
    }
    log(message: "[DatabaseManager:] All tickers removed from CoreData")
  }
  
  // MARK: - Private methods
  private func saveContext() {
    guard managedContext.hasChanges else { return }

    do {
      try managedContext.save()
    } catch let error as NSError {
      log(message: "[DatabaseManager:] Error saving context \(error), \(error.userInfo)")
    }
  }
  
  private func makeTickerWithTickerData(data: TickerData, in context: NSManagedObjectContext) {
    let tickerToSave = Ticker(context: managedContext)
    tickerToSave.symbol = data.symbol
    tickerToSave.displaySymbol = data.displaySymbol
    tickerToSave.tickerDescription = data.description
  }
  
  private func log(message: String) {
    if logInfo { print(message) }
  }
}
