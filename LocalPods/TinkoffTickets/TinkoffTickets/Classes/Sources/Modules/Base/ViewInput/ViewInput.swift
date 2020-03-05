//
//  ViewInput.swift
//  TinkoffTickets
//
//  Created by Omar on 05.03.2020.
//

import Foundation
import MBProgressHUD

protocol ViewInput: class {
    func showSpinner()
    func hideSpinner()
}

extension ViewInput where Self: UIViewController {
    func showSpinner() {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    func hideSpinner() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
