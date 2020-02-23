//
//  Constants.swift
//  TinkoffProject
//
//  Created by Anvar Karimov on 23.02.2020.
//  Copyright © 2020 tinkoff-group-5. All rights reserved.
//

import Foundation

// MARK: - Typealiases
typealias CompletionBlock = () -> Void
typealias AlertCompletionBlock = (String) -> Void

// MARK: - Storyboards enum
enum Storyboards: String {
    case authorization = "Auth"
    case main          = "Main"
    case onboarding    = "Onboarding"
}

// MARK: - PersistantKeys enum
enum PersistantKeys {
    static let isSeenOnboarding = "kIsSeenOnboarding"
    static let token            = "kToken"
}
