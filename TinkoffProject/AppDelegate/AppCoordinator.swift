//
//  AppCoordinator.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

final class AppCoordinator: BaseCoordinator {
    
    fileprivate let factory: CoordinatorFactoryProtocol
    fileprivate let router : Routable
    
    fileprivate let gateway = Gateway()
    
    init(router: Routable, factory: CoordinatorFactory) {
        self.router  = router
        self.factory = factory
    }
}
 
// MARK:- Coordinatable
extension AppCoordinator: Coordinatable {
    func start() {
        self.gateway.getState { [unowned self] (state) in
            switch state {
            case .authorization:
                self.performAuthorizationFlow()
            case .main:
                self.performMainFlow()
           }
        }
    }
}
 
// MARK:- Private methods
    func performAuthorizationFlow() {
        let coordinator = factory.makeAuthorizationCoordinator(with: router)
        coordinator.finishFlow = { [weak self, weak coordinator] in
            guard
                let `self` = self,
                let `coordinator` = coordinator
            else { return }
            self.removeDependency(coordinator)
            self.start()
        }
        addDependency(coordinator)
        coordinator.start()
    }
 
func performMainFlow() {
// MARK:- main flow logic
}

