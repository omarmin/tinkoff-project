//
//  LoginScreenWireframe.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import UIKit

class LoginScreenWireframe: LoginScreenWireframeInput {
    var coordinator: AuthCoordinator!
    var loginScreenPresenter: LoginScreenPresenter!
    
    func showPinScreen() {
        coordinator.showPinCodeScreen()
    }
    
    func showMainScreen() {
        coordinator.showMainScreen()
    }
    
    func loginScreenViewControllerFromStoryboard() -> LoginScreenViewController {
        return R.storyboard.loginScreen.loginScreenViewController() ?? LoginScreenViewController()
    }
}
