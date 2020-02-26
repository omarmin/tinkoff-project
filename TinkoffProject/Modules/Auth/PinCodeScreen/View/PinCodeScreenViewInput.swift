import Foundation

protocol PinCodeScreenViewInput: class {
    func setupInitialState()
    func resetViewState(type: PinCodeScreenViewType)
    func showActivityIndicator()
    func hideActivityIndicator()
    func showInfoLabel(text: String)
    func hideInfoLabel()
    func showWrongPinCodeViewState()
}
