//
//  MainCoordinatorOutput.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

protocol MainCoordinatorOutput: class {
    var finishFlow: CompletionBlock? { get set }
}
