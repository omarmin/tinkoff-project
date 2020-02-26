import Foundation

protocol PinCodeScreenInteractorOutput: class {
    func didVerifyPinCodeSuccessfully()
    func didFinishVerificationWithError(_ : Error)
    
    func didSavePinCodeSuccessfully()
}
