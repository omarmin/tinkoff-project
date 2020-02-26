//
//  LoginScreenFactoryProtocol.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 24/02/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

protocol AuthFactoryProtocol {
    func makeLoginViewWithCoordinator(coordinator: AuthCoordinator) -> LoginScreenViewController
    func makePinCodeView(
        coordinator: AuthCoordinator,
        configure: PinCodeScreenAssembly.PinCodeScreenModuleConfiguration
    ) -> PinCodeScreenViewController
}

// MARK: - AuthFactoryProtocol
final class AuthFactory: AuthFactoryProtocol {
    func makeLoginViewWithCoordinator(coordinator: AuthCoordinator) -> LoginScreenViewController {
        let loginScreenViewController = R.storyboard.loginScreen.loginScreenViewController()!
        LoginScreenAssembly.assembly(with: loginScreenViewController, moduleOutput: coordinator)
        return loginScreenViewController
    }
    
    func makePinCodeView(
        coordinator: AuthCoordinator,
        configure: PinCodeScreenAssembly.PinCodeScreenModuleConfiguration
    ) -> PinCodeScreenViewController {
        let pinCodeViewController = R.storyboard.pinCodeScreen.instantiateInitialViewController()!
        PinCodeScreenAssembly.assembly(with: pinCodeViewController, moduleOutput: coordinator, configure: configure)
        return pinCodeViewController
    }
}
