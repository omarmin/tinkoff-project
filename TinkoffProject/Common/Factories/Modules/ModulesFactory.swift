//
//  ModulesFactory.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import UIKit

final class ModulesFactory {}

// MARK: - MainFactoryProtocol
extension ModulesFactory: MainFactoryProtocol {
    func makeMainView() -> ViewController {
        let mainView: ViewController = ViewController()
        mainView.view.backgroundColor = .red
        return mainView
    }
}

// MARK: - AuthFactoryProtocol
extension ModulesFactory: AuthFactoryProtocol {
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
