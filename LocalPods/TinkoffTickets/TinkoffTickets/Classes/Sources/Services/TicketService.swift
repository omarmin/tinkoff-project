//
//  TicketService.swift
//  TinkoffTickets
//
//  Created by Omar on 04.03.2020.
//

import Foundation
import TinkoffNetwork

protocol ITicketService {
    func loadTickets(exchange: String, completion: @escaping ((Result<[Ticket], Error>) -> Void))
}

class TicketService: ITicketService {
    let networkManager: INetworkManager = NetworkManager()
    
    func loadTickets(exchange: String, completion: @escaping ((Result<[Ticket], Error>) -> Void)) {
        let parameters = [
            "exchange": "\(exchange)",
            "token": "bpfq4e7rh5rd7o6env1g"
        ]
        
        let request = Request(TicketEndpoint.tickets, parameters: parameters)
        
        networkManager.perform(request: request) { (result: Result<[Ticket], Error>) in
            completion(result)
        }
    }
}
