//
//  LoginScreenInteractor.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import Foundation

class LoginScreenInteractor: LoginScreenInteractorInput {
  
  private var pinSelected: Bool?
  private var userInfo: [String: Any]?
  var output: LoginScreenInteractorOutput!
  
    func checkUserWithCredentials(login: String, pass: String) {
      //simulating network request
      DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
        self.userInfo = ["userID": "test001"]
        self.credentialsChecked()
      }
  }
  
  private func credentialsChecked() {
    if var userInfo = userInfo {
       userInfo["isPinSelected"] = pinSelected ?? false
       output.userSuccessfullyAuthenticated(userInfo: userInfo)
    } else {
      let error = NSError(domain: "", code: 9999, userInfo: nil)
      output.userAuthenticationError(error: error)
    }
  }
  
  private func credentialsCheckError(error: Error) {
    output.userAuthenticationError(error: error)
  }
}
