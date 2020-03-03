//
//  TickerDataController.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 03/03/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

protocol TickerDataControllerProtocol {
  func fetchTickerDataWith(symbol: String, completion: @escaping (TickerData?) -> Void)
  func fetchAllTickers(completion: @escaping ([TickerData?]) -> Void)
  func createOrUpdateTicker(symbol: String, displaySymbol: String?, description: String?)
  func deleteAll()
}

class TickerDataController: TickerDataControllerProtocol {
  let worker: CoreDataWorkerProtocol
  
  init(worker: CoreDataWorkerProtocol = CoreDataWorker()) {
    self.worker = worker
  }
  
  func fetchTickerDataWith(symbol: String, completion: @escaping (TickerData?) -> Void) {
    let predicate = NSPredicate(format: "symbol == %@", symbol)
    
    worker.get(with: predicate, sortDescriptors: nil, fetchLimit: nil) { (result: Result<[TickerData], Error>) in
      switch result {
      case .success(let tickers):
        completion(tickers.first)
      case .failure(let error):
        print("\(error)")
        completion(nil)
      }
    }
  }
  
  func fetchAllTickers(completion: @escaping ([TickerData?]) -> Void) {
    worker.get {(result: Result<[TickerData], Error>) in
      switch result {
      case .success(let tickers):
        completion(tickers)
      case .failure(let error):
        print("\(error)")
        completion([])
      }
    }
  }
  
  func createOrUpdateTicker(symbol: String, displaySymbol: String?, description: String?) {
    let tickerData = TickerData(description: description,
                                symbol: symbol,
                                displaySymbol: displaySymbol)
    worker.createOrUpdate(entities: [tickerData]) { (error) in
      guard let error = error else { return }
      print("\(error)")
    }
  }
  
  func deleteAll() {
    worker.deleteAll(managedObjectType: Ticker.self)
  }
}
