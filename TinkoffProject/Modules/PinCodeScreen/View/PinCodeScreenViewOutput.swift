import Foundation

protocol PinCodeScreenViewOutput: class {
    func didTriggerViewReadyEvent()
    func didEnter(pinCode: String)
    func didConfirm(pinCode: String)
}
