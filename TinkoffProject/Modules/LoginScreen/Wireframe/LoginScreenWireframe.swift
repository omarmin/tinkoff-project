//
//  LoginScreenWireframe.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import UIKit

class LoginScreenWireframe: LoginScreenWireframeInput {
  private let loginScreenStoryboardName = "LoginScreen"
  private let loginScreenViewControllerID = "loginScreenViewController"
  
  var coordinator: LoginScreenCoordinator!
  var loginScreenPresenter: LoginScreenPresenter!
  
  func showPinScreen() {
    coordinator.showPinCodeScreen()
  }
  
  func showMainScreen() {
    coordinator.showMainScreen()
  }
  
  func loginScreenViewControllerFromStoryboard() -> LoginScreenViewController {
    return loginScreenStoryboard().instantiateViewController(identifier: loginScreenViewControllerID)
  }
  
  private func loginScreenStoryboard() -> UIStoryboard {
    return UIStoryboard.init(name: loginScreenStoryboardName, bundle: Bundle.main)
  }
}
