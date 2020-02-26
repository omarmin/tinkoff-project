//
//  AppDelegate.swift
//  TinkoffProject
//
//  Created by Omar on 21.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var rootController: UINavigationController {
        let navigationController: UINavigationController = UINavigationController()
        self.window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return navigationController
    }
    
    fileprivate lazy var coordinator: Coordinatable = self.makeCoordinator()

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        coordinator.start()
        return true
    }
}

// MARK: - Private methods
private extension AppDelegate {
    func makeCoordinator() -> Coordinatable {
        return AppCoordinator(router: Router(rootController: rootController), factory: CoordinatorFactory())
    }
}
