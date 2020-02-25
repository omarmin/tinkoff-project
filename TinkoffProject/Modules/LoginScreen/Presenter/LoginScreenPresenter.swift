//
//  LoginScreenPresenter.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import Foundation

class LoginScreenPresenter: LoginScreenModuleInterface {
  
  private let authErrorMessage = "Ошибка авторизации"
  private var pinSelected = false

  weak var view: LoginScreenViewInterface!
  var interactor: LoginScreenInteractorInput!
  var wireframe: LoginScreenWireframeInput!
        
  func checkUserWithCredentials(login: String, pass: String) {
    view.setInputEnabled(status: false)
    interactor.checkUserWithCredentials(login: login, pass: pass)
  }
  
  func userChangedPinToggle(state: Bool) {
    pinSelected = state
  }
}

extension LoginScreenPresenter: LoginScreenInteractorOutput {
  func userSuccessfullyAuthenticated(userInfo: [String: Any]) {
    pinSelected ? wireframe.showPinScreen() : wireframe.showMainScreen()
  }
  
  func userAuthenticationError(error: Error) {
    view.setInputEnabled(status: true)
    view.showErrorMessage(text: authErrorMessage)
  }
}
