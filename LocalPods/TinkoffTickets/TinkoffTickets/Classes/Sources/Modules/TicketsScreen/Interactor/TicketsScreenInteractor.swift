import Foundation

final class TicketsScreenInteractor {
    weak var output: TicketsScreenInteractorOutput!
    var ticketService: ITicketService = TicketService()
}

// MARK: - TicketsScreenInteractorInput
extension TicketsScreenInteractor: TicketsScreenInteractorInput {
    
    func loadTickets(exchange: String) {
        ticketService.loadTickets(exchange: exchange) { [weak self] result in
            switch result {
            case .success(let tickets):
                self?.output.didLoadTicketsSuccessfully(tickets.map {
                    TicketCellViewModel(
                        displaySymbol: $0.displaySymbol,
                        description: $0.description
                    )
                })
            case .failure(let error):
                self?.output.didFailedLoadingTickets(with: error)
            }
        }
    }
}
