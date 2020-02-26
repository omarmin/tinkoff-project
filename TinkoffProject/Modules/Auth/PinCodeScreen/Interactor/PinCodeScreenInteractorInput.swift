import Foundation

protocol PinCodeScreenInteractorInput: class {
    func verify(pinCode: String)
    func save(pinCode: String)
}
