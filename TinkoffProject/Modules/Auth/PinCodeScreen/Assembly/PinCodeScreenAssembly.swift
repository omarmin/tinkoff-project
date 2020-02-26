import Foundation

final class PinCodeScreenAssembly {
    
    typealias PinCodeScreenModuleConfiguration = (PinCodeScreenModuleInput) -> Void
    
    static func assembly(with view: PinCodeScreenViewController, coordinator: AuthCoordinator, configure: PinCodeScreenModuleConfiguration) {
        let presenter = PinCodeScreenPresenter()
        let interactor = PinCodeScreenInteractor()
        let router = PinCodeScreenRouter()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        view.output = presenter
        router.coordinator = coordinator
        
        configure(presenter)
    }
}
