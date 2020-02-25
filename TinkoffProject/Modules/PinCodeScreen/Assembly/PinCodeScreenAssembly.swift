import Foundation

final class PinCodeScreenAssembly {
    
    static func assembly(with view: PinCodeScreenViewController) {
        let presenter = PinCodeScreenPresenter()
        let interactor = PinCodeScreenInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
        view.output = presenter
    }
}
