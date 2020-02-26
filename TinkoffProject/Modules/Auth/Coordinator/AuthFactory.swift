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

// MARK: - AuthFactoryProtocol
final class AuthFactory: AuthFactoryProtocol {
    func makeLoginViewWithCoordinator(coordinator: AuthCoordinator) -> UIViewController {
        let loginScreenViewController = TinkoffAuth.R.storyboard.loginScreen.loginScreenViewController()!
        LoginScreenAssembly.assembly(with: loginScreenViewController, moduleOutput: coordinator)
        return loginScreenViewController
    }
    
    func makePinCodeView(
        coordinator: AuthCoordinator,
        configure: PinCodeScreenAssembly.PinCodeScreenModuleConfiguration
    ) -> UIViewController {
        let pinCodeViewController = TinkoffAuth.R.storyboard.pinCodeScreen.instantiateInitialViewController()!
        PinCodeScreenAssembly.assembly(with: pinCodeViewController, moduleOutput: coordinator, configure: configure)
        return pinCodeViewController
    }
}
