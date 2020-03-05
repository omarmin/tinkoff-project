import Foundation

final class PinCodeScreenInteractor {
    weak var output: PinCodeScreenInteractorOutput!
}

// MARK: - PinCodeScreenInteractorInput
extension PinCodeScreenInteractor: PinCodeScreenInteractorInput {

    func verify(pinCode: String) {
        let savedPinCode = UserDefaults.standard.value(forKey: "PinCode") as? String
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if savedPinCode == pinCode {
                self?.output.didVerifyPinCodeSuccessfully()
            } else {
                let error = NSError(domain: "", code: 999, userInfo: nil)
                self?.output.didFinishVerificationWithError(error)
            }
        }
    }
    
    func save(pinCode: String) {
        UserDefaults.standard.set(pinCode, forKey: "PinCode")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.output.didSavePinCodeSuccessfully()
        }
    }
}
