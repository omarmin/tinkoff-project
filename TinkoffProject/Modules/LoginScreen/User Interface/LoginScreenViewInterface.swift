//
//  LoginScreenViewInterface.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import Foundation

protocol LoginScreenViewInterface: class {
  func resetContent()
  func showLoadingIndicator()
  func hideLoadingIndicator()
  func setNextButtonEnabled(state: Bool)
  func showErrorMessage(text: String)
}
