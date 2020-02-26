import UIKit

final class PinCodeScreenViewController: UIViewController {

    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var pointsView: PointsView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var buttons: [UIButton]!
    
    // MARK: Constants
    private let pinCodeLength = 4
    
    // MARK: Properties
    var output: PinCodeScreenViewOutput!
    var pinCode: String = ""
    var type: PinCodeScreenViewType = .input

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.didTriggerViewReadyEvent()
    }

    @IBAction func didTapNumberButton(_ sender: UIButton) {
        let digit = sender.titleLabel?.text ?? ""
        pinCode += digit
        pinCodeDidChange()
    }
    
    @IBAction func didTapRemoveButton(_ sender: UIButton) {
        if pinCode.isEmpty {
            return
        }
        
        pinCode.removeLast()
        pinCodeDidChange()
    }
    
    @IBAction func didTapLogoutButton(_ sender: UIButton) {
        output.didTapLogout()
    }
    
    private func pinCodeDidChange() {
        pointsView.fill(numberOfPoints: pinCode.count)
        
        guard pinCode.count == pinCodeLength else {
            return
        }
        
        switch type {
        case .input:
            output.didEnter(pinCode: pinCode)
        case .confirm:
            output.didConfirm(pinCode: pinCode)
        }
    }
    
}

// MARK: - PinCodeScreenViewInput
extension PinCodeScreenViewController: PinCodeScreenViewInput {

    func setupInitialState() {
        infoLabel.isHidden = true
    }
    
    func resetViewState(type: PinCodeScreenViewType) {
        self.type = type
        pinCode = ""
        pointsView.clear()
    }
    
    func showActivityIndicator() {
        buttons.forEach { $0.isEnabled = false }
        activityIndicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        buttons.forEach { $0.isEnabled = true }
        activityIndicator.stopAnimating()
    }
    
    func showInfoLabel(text: String) {
        infoLabel.text = text
        infoLabel.isHidden = false
    }
    
    func hideInfoLabel() {
        infoLabel.isHidden = true
    }
    
    func showWrongPinCodeViewState() {
        pointsView.highlight(color: .red) {
            self.pinCode = ""
            self.pointsView.clear()
        }
    }
}
