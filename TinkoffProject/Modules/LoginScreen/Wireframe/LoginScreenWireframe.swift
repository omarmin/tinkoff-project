//
//  LoginScreenWireframe.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import UIKit

class LoginScreenWireframe {
  
  private let loginScreenStoryboardName = "LoginScreen"
  private let loginScreenViewControllerID = "loginScreenViewController"
  
  var rootWireframe: RootWireframe!
  var loginScreenPresenter: LoginScreenPresenter!
  var pinScreenWireframe: PinScreenWireframe!
  var mainScreenWireframe: MainScreenWireframe!
  
  func showPinScreen() {
    pinScreenWireframe.showPinScreenInteface()
  }
  
  func showMainScreen() {
    mainScreenWireframe.showMainScreenInterface()
  }
  
  func loginScreenViewControllerFromStoryboard() -> LoginScreenViewController {
    return loginScreenStoryboard().instantiateViewController(identifier: loginScreenViewControllerID)
  }
  
  private func loginScreenStoryboard() -> UIStoryboard {
    return UIStoryboard.init(name: loginScreenStoryboardName, bundle: Bundle.main)
  }
}
