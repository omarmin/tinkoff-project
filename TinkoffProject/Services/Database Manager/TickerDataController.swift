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
    func updateTicker(name: String?, username: String?)
}

class TickerDataController: TickerDataControllerProtocol {
    let worker: CoreDataWorkerProtocol
    private var currentTickerData: TickerData?
    
    init(worker: CoreDataWorkerProtocol = CoreDataWorker()) {
        self.worker = worker
    }
    
    func fetchTickerDataWith(symbol: String, completion: @escaping (TickerData?) -> Void) {
        let predicate = NSPredicate(format: "identifier == %@", symbol)

        worker.get(with: predicate, sortDescriptors: nil, fetchLimit: .max) { [weak self] (result: Result<[TickerData], Error>) in
            switch result {
            case .success(let tickers):
                self?.currentTickerData = tickers.first
                completion(tickers.first)
            case .failure(let error):
                print("\(error)")
                completion(nil)
            }
        }
    }
    
    func updateTicker(name: String?, username: String?) {
        let tickerData: TickerData = currentTickerData ?? TickerData(description: "Dummy ticker", symbol: "DT", displaySymbol: "DTR")
        worker.upsert(entities: [tickerData]) { (error) in
            guard let error = error else { return }
            print("\(error)")
        }
    }
}
