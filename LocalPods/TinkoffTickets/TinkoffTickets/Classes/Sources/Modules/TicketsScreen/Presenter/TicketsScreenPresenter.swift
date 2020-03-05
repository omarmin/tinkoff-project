import Foundation

final class TicketsScreenPresenter {

    // MARK: Properties
    weak var view: TicketsScreenViewInput!
    var interactor: TicketsScreenInteractorInput!
}

// MARK: - TicketsScreenViewOutput
extension TicketsScreenPresenter: TicketsScreenViewOutput {

    func didTriggerViewReadyEvent() {
        view.setupInitialState()
        view.showSpinner()
        interactor.loadTickets(exchange: "US")
    }
}

// MARK: - TicketsScreenInteractorOutput
extension TicketsScreenPresenter: TicketsScreenInteractorOutput {
    
    func didLoadTicketsSuccessfully(_ tickets: [TicketCellViewModel]) {
        view.show(tickets)
        view.hideSpinner()
    }
    
    func didFailedLoadingTickets(with error: Error) {
        
    }
}
