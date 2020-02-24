//
//  CoordinatorFactoryProtocol.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import UIKit

protocol CoordinatorFactoryProtocol {
    func makeMainCoordinator(router: Routable) -> Coordinatable & MainCoordinatorOutput
//    func makeSetPINCoordinator(router: Routable) -> Coordinatable & SetPINCoordinatorOutput
//    func makeEnterPINCoordinator(router: Routable) -> Coordinatable & EnterPINCoordinatorOutput
//    func makeAuthorizationCoordinator(router: Routable) -> Coordinatable & AuthorizationCoordinatorOutput
}
