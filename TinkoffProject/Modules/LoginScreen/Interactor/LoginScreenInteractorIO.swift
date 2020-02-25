//
//  LoginScreenInteractorIO.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import Foundation

protocol LoginScreenInteractorInput {
  func checkUserWithCredentials(login: String, pass: String)
}

protocol LoginScreenInteractorOutput {
  func userSuccessfullyAuthenticated(userInfo: [String: Any])
  func userAuthenticationError(error: Error)
}
