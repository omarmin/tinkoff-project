//
//  CommonFunctions.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import UIKit

class CommonFunctions {
  
  static func validateLogin(login: String) -> Bool {
    if 3 < login.count && login.count < 20 && hasOnlyLatinSymbols(in: login) {
      return true
    }
    return false
  }
  
  static func validatePassword(password: String) -> Bool {
    if 8 < password.count && password.count < 20 {
      return true
    }
    return false
  }
  
  static func hasOnlyLatinSymbols(in string: String) -> Bool {
    return string.range(of: "\\P{Latin}", options: .regularExpression) == nil
  }
  
  static func addDefaultConstraintsToView(view: UIView, in parentView: UIView) {
    view.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      view.topAnchor.constraint(equalTo: parentView.topAnchor),
      view.leadingAnchor.constraint(equalTo: parentView.leadingAnchor),
      view.trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
      view.bottomAnchor.constraint(equalTo: parentView.bottomAnchor)
    ])
  }
}
