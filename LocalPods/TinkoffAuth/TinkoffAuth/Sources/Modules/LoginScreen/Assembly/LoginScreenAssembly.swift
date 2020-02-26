import Foundation

public final class LoginScreenAssembly {
    
    public static func assembly(
        with view: LoginScreenViewController,
        moduleOutput: LoginScreenModuleOutput? = nil
    ) {
        let loginScreenPresenter = LoginScreenPresenter()
        let loginScreenInteractor = LoginScreenInteractor()
        
        view.eventHandler = loginScreenPresenter
        loginScreenPresenter.view = view
        loginScreenPresenter.interactor = loginScreenInteractor
        loginScreenPresenter.moduleOutput = moduleOutput
        
        loginScreenInteractor.output = loginScreenPresenter
    }
}
