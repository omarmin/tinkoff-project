//
//  AppCoordinator.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

private enum LaunchInstructor {
    case authorization, main
    
    static func setup() -> LaunchInstructor {
        return .authorization
    }
}

final class AppCoordinator: BaseCoordinator {
    
    fileprivate let router: Routable
    fileprivate let factory: CoordinatorFactoryProtocol
    
    fileprivate var instructor: LaunchInstructor = LaunchInstructor.setup()
    
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
            self.instructor = .authorization
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
    
    func performAuthorizationFlow() {
        let coordinator = factory.makeAuthCoordinator(router: router)
        coordinator.finishFlow = { [unowned self, unowned coordinator] in
            self.removeDependency(coordinator)
            self.instructor = .main
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
}
