//
//  LoginScreenWireframeInput.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 25/02/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

protocol LoginScreenWireframeInput: class {
    func showPinScreen()
    func showMainScreen()
    func loginScreenViewControllerFromStoryboard() -> LoginScreenViewController
}
