//
//  LoginScreenCoordinator.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 24/02/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

final class AuthCoordinator: BaseCoordinator, AuthCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let router: Routable
    fileprivate let factory: AuthFactoryProtocol
    
    init(with factory: AuthFactoryProtocol, router: Routable) {
        self.factory = factory
        self.router  = router
    }
}

// MARK: - Coordinatable
extension AuthCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
    
    func showMainScreen() {
        finishFlow?()
    }
    
    func showLoginScreen() {
        let view = factory.makeLoginViewWithCoordinator(coordinator: self)
        router.setRootModule(view, hideBar: true)
    }
    
    func showPinCodeScreen() {
        let view = factory.makePinCodeView(coordinator: self) { moduleInput in
            moduleInput.configure(with: .create)
        }
        router.push(view)
    }
}

// MARK: - Private methods
private extension AuthCoordinator {
    func performFlow() {
        if UserDefaults.standard.string(forKey: "PinCode") != nil {
            let view = factory.makePinCodeView(coordinator: self) { moduleInput in
                moduleInput.configure(with: .enter)
            }
            router.setRootModule(view, hideBar: true)
        } else {
            let view = factory.makeLoginViewWithCoordinator(coordinator: self)
            router.setRootModule(view, hideBar: true)
        }
    }
}
