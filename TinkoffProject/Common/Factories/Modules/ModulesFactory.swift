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
        let view: ViewController = ViewController()
        return view
    }
}

extension ModulesFactory: LoginScreenFactoryProtocol {
  func makeLoginViewWithCoordinator(coordinator: LoginScreenCoordinator) -> LoginScreenViewController {
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
}
