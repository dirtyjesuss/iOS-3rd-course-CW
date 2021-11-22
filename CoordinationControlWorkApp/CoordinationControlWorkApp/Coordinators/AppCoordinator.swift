//
//  AppCoordinator.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {

    // MARK: - Instance properties

    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    private var authorizationService: AuthorizationService

    // MARK: - Init

    init(navigationController: UINavigationController, authorizationService: AuthorizationService) {
        self.navigationController = navigationController
        self.authorizationService = authorizationService
    }

    // MARK: - Instance methods

    func start() {
        if authorizationService.isAuthorized {
            startMainFlow()
        } else {
            startAuthorizationFlow()
        }
    }

    private func startAuthorizationFlow() {

    }

    private func startMainFlow() {

    }
}
