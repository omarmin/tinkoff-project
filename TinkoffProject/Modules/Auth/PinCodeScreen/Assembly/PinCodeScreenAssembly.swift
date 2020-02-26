import Foundation

public final class PinCodeScreenAssembly {
    
    public typealias PinCodeScreenModuleConfiguration = (PinCodeScreenModuleInput) -> Void
    
    public static func assembly(
        with view: PinCodeScreenViewController,
        moduleOutput: PinCodeScreenModuleOutput? = nil,
        configure: PinCodeScreenModuleConfiguration
    ) {
        let presenter = PinCodeScreenPresenter()
        let interactor = PinCodeScreenInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.moduleOutput = moduleOutput
        
        interactor.output = presenter
        view.output = presenter
        
        configure(presenter)
    }
}
