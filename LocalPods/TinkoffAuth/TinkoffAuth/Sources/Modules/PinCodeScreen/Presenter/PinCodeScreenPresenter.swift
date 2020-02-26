import Foundation

final class PinCodeScreenPresenter {

    // MARK: Properties
    weak var view: PinCodeScreenViewInput!
    var interactor: PinCodeScreenInteractorInput!
    weak var moduleOutput: PinCodeScreenModuleOutput?
    var pinCodeType: PinCodeModuleType = .enter
    
    var pinCode = ""
}

// MARK: - PinCodeScreenModuleInput
extension PinCodeScreenPresenter: PinCodeScreenModuleInput {
    
    func configure(with pinCodeType: PinCodeModuleType) {
        self.pinCodeType = pinCodeType
    }
}

// MARK: - PinCodeScreenViewOutput
extension PinCodeScreenPresenter: PinCodeScreenViewOutput {

    func didTriggerViewReadyEvent() {
        view.setupInitialState()
        
        switch pinCodeType {
        case .enter:
            view.hideInfoLabel()
        case .create:
            view.showInfoLabel(text: "Введите пин-код")
        }
    }
    
    func didEnter(pinCode: String) {
        self.pinCode = pinCode
        view.showActivityIndicator()
        
        switch pinCodeType {
        case .enter:
            interactor.verify(pinCode: pinCode)
        case .create:
            view.resetViewState(type: .confirm)
            view.showInfoLabel(text: "Повторите пин-код")
            view.hideActivityIndicator()
        }
    }
    
    func didConfirm(pinCode: String) {
        view.showActivityIndicator()
        
        if self.pinCode == pinCode {
            interactor.save(pinCode: pinCode)
        } else {
            view.resetViewState(type: .input)
            view.showWrongPinCodeViewState()
            view.showInfoLabel(text: "Введите пин-код")
            view.hideActivityIndicator()
        }
    }
    
    func didTapLogout() {
        UserDefaults.standard.set(nil, forKey: "PinCode")
        moduleOutput?.showLoginScreen()
    }
}

// MARK: - PinCodeScreenInteractorOutput
extension PinCodeScreenPresenter: PinCodeScreenInteractorOutput {
    
    func didVerifyPinCodeSuccessfully() {
        view.hideActivityIndicator()
        moduleOutput?.showMainScreen()
    }
    
    func didFinishVerificationWithError(_: Error) {
        view.resetViewState(type: .input)
        view.showWrongPinCodeViewState()
        view.hideActivityIndicator()
    }
    
    func didSavePinCodeSuccessfully() {
        view.hideActivityIndicator()
        moduleOutput?.showMainScreen()
    }
}
