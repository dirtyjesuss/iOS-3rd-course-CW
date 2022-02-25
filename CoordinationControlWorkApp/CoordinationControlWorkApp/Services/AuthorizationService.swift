//
//  AuthorizationService.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import Foundation

protocol AuthorizationService {
    var isAuthorized: Bool { get }
    func setIsAuthorized(_ isAuthorized: Bool)
}

struct AuthorizationServiceImp: AuthorizationService {

    // MARK: - Constants

    private enum Constants {
        static let key = "isAuthorized"
    }

    // MARK: - AuthorizationService

    var isAuthorized: Bool {
        UserDefaults.standard.bool(forKey: Constants.key)
    }

    func setIsAuthorized(_ isAuthorized: Bool) {
        UserDefaults.standard.set(isAuthorized, forKey: Constants.key)
    }
}
