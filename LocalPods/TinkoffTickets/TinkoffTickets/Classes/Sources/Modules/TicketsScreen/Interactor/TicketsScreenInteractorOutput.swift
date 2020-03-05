import Foundation

protocol TicketsScreenInteractorOutput: class {
    func didLoadTicketsSuccessfully(_ tickets: [TicketCellViewModel])
    func didFailedLoadingTickets(with error: Error)
}
