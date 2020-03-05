//
//  ModulesFactory.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import UIKit
import TinkoffTickets

final class ModulesFactory {}

// MARK: - MainFactoryProtocol
extension ModulesFactory: MainFactoryProtocol {
    func makeMainView() -> UIViewController {
        let view = TicketsScreenAssembly.assembly()
        return view
    }
}
