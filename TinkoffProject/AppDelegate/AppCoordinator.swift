//
//  AppCoordinator.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

private enum LaunchInstructor {
    case authorization, setPIN, enterPIN, main
        
    static func setup() -> LaunchInstructor {
        /// Здесь нужно разруливать что показывать первым делом
        return .main
    }
}

final class AppCoordinator: BaseCoordinator {

    fileprivate let router: Routable
    fileprivate let factory: CoordinatorFactoryProtocol

    fileprivate var instructor: LaunchInstructor {
        return LaunchInstructor.setup()
    }

    init(router: Routable, factory: CoordinatorFactory) {
        self.router  = router
        self.factory = factory
    }
}

// MARK: - Coordinatable
extension AppCoordinator: Coordinatable {
    func start() {
        switch instructor {
        case .main:
            performMainFlow()
        case .setPIN:
            performSetPINFlow()
        case .enterPIN:
            performEnterPINFlow()
        case .authorization:
            performAuthorizationFlow()
        }
    }
}

// MARK: - Private methods
private extension AppCoordinator {

    func performMainFlow() {
        let coordinator = factory.makeMainCoordinator(router: router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }

    func performSetPINFlow() {
        // Start set PIN flow
    }

    func performEnterPINFlow() {
        // Start enter PIN flow
    }

    func performAuthorizationFlow() {
        // Start authorization flow
    }
}
