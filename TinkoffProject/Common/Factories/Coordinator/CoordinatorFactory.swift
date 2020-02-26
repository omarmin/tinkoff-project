//
//  CoordinatorFactory.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import UIKit

final class CoordinatorFactory {
    fileprivate let modulesFactory = ModulesFactory()
    fileprivate let authFactory = AuthFactory()
}

// MARK: - CoordinatorFactoryProtocol
extension CoordinatorFactory: CoordinatorFactoryProtocol {
  func makeMainCoordinator(router: Routable) -> Coordinatable & MainCoordinatorOutput {
    return MainCoordinator(with: modulesFactory, router: router)
  }
  
  func makeAuthCoordinator(router: Routable) -> Coordinatable & AuthCoordinatorOutput {
    return AuthCoordinator(with: authFactory, router: router)
  }
}
