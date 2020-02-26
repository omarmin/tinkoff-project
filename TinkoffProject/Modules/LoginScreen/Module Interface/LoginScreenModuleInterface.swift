//
//  LoginScreenModuleInterface.swift
//  TinkoffTeamFive
//
//  Created by Gennady Stepanov on 22/02/2020.
//  Copyright © 2020 TinkoffTraining. All rights reserved.
//

import Foundation

protocol LoginScreenModuleInterface: class {
    func checkUserWithCredentials(login: String, pass: String)
    func userChangedPinToggle(state: Bool)
}
