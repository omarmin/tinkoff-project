import Foundation

final class PinCodeScreenRouter {
    var coordinator: AuthCoordinator!
}

// MARK: - PinCodeScreenRouterInput
extension PinCodeScreenRouter: PinCodeScreenRouterInput {
    
    func showLoginScreen() {
        coordinator.showLoginScreen()
    }
    
    func showMainScreen() {
        coordinator.showMainScreen()
    }
}
