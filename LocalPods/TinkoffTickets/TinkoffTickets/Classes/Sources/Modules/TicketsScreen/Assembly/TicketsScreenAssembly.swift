import Foundation

public final class TicketsScreenAssembly {
        
    public static func assembly() -> UIViewController {
        let view = R.storyboard.tickets.ticketsScreenViewController()!
        let presenter = TicketsScreenPresenter()
        let interactor = TicketsScreenInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        
        interactor.output = presenter
        view.output = presenter
        
        return view
    }
}
