//
//  LoginScreenCoordinatorOutput.swift
//  TinkoffProject
//
//  Created by Gennady Stepanov on 24/02/2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

protocol LoginScreenCoordinatorOutput: class {
    var finishFlow: CompletionBlock? { get set }
}
