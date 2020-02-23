//
//  BaseCoordinator.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

class BaseCoordinator {
    
    var childCoordinators: [Coordinatable] = []
    
    func addDependency(_ coordinator: Coordinatable) {        
        for element in childCoordinators where element === coordinator {
            return
        }
        childCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinatable?) {
        guard
            childCoordinators.isEmpty == false,
            let coordinator = coordinator
            else { return }
        
        for (index, element) in childCoordinators.enumerated() where element === coordinator {
            childCoordinators.remove(at: index)
            break
        }
    }
}
