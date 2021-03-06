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
            showMainFlow()
        } else {
            showAuthorizationFlow()
        }
    }

    private func showAuthorizationFlow() {
        let module = ProfileCoordinator(navigationController: navigationController)
        module.flowCompletionHandler = { [weak self] in
            guard let self = self else { return }

            self.authorizationService.setIsAuthorized(true)
            self.childDidFinish(module)
            self.showMainFlow()
        }

        module.start()
    }

    private func showMainFlow() {
        let scene = MainViewController()
        scene.service = ActivityService()
        scene.completionHandler = { [weak self] _ in
            guard let self = self else { return }

            self.authorizationService.setIsAuthorized(false)
            self.showAuthorizationFlow()
        }

        navigationController.setViewControllers([scene], animated: true)
    }
}
