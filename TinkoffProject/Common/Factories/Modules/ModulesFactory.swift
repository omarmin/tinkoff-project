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
        let loginSceenWireframe = LoginScreenWireframe()
        let loginScreenPresenter = LoginScreenPresenter()
        let loginScreenInteractor = LoginScreenInteractor()
        let loginScreenViewController = loginSceenWireframe.loginScreenViewControllerFromStoryboard()
        loginScreenViewController.eventHandler = loginScreenPresenter
        loginScreenPresenter.view = loginScreenViewController
        loginScreenPresenter.interactor = loginScreenInteractor
        loginScreenPresenter.wireframe = loginSceenWireframe
        loginSceenWireframe.coordinator = coordinator
        loginScreenInteractor.output = loginScreenPresenter
        
        return loginScreenViewController
    }
    
    func makePinCodeView(
        coordinator: AuthCoordinator,
        configure: PinCodeScreenAssembly.PinCodeScreenModuleConfiguration
    ) -> PinCodeScreenViewController {
        let pinCodeView = R.storyboard.pinCodeScreen.instantiateInitialViewController()!
        PinCodeScreenAssembly.assembly(with: pinCodeView, coordinator: coordinator, configure: configure)
        return pinCodeView
    }
}
