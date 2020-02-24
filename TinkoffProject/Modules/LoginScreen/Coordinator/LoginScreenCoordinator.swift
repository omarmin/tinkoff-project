//
//  LoginScreenCoordinator.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 24/02/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

final class LoginScreenCoordinator: BaseCoordinator, LoginScreenCoordinatorOutput {
    
    var finishFlow: CompletionBlock?
    
    fileprivate let router: Routable
    fileprivate let factory: LoginScreenFactoryProtocol
    
    init(with factory: LoginScreenFactoryProtocol, router: Routable) {
        self.factory = factory
        self.router  = router
    }
}

// MARK: - Coordinatable
extension LoginScreenCoordinator: Coordinatable {
    func start() {
        performFlow()
    }
}

// MARK: - Private methods
private extension LoginScreenCoordinator {
    func performFlow() {
        let view = factory.makeLoginView()
        router.setRootModule(view, hideBar: true)
    }
}
