//
//  LoginScreenFactoryProtocol.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 24/02/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import UIKit
import TinkoffAuth

protocol AuthFactoryProtocol {
    func makeLoginViewWithCoordinator(coordinator: AuthCoordinator) -> UIViewController
    func makePinCodeView(
        coordinator: AuthCoordinator,
        configure: PinCodeScreenAssembly.PinCodeScreenModuleConfiguration
    ) -> UIViewController
}
