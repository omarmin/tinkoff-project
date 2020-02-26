import Foundation

protocol PinCodeScreenInteractorOutput: class {
    func didVerifyPinCodeSuccessfully()
    func didVerifyPinCode(error: Error)
    
    func didSavePinCodeSuccessfully()
}
