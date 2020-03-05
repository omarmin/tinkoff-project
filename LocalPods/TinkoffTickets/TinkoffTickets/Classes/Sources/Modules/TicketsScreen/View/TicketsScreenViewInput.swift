import Foundation

protocol TicketsScreenViewInput: ViewInput {
    func setupInitialState()
    func show(_ tickets: [TicketCellViewModel])
}
