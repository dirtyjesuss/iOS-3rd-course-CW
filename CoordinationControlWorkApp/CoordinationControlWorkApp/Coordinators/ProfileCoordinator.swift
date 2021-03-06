//
//  ProfileCoordinator.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {

    // MARK: - Instance properties

    var childCoordinators: [Coordinator] = []

    var navigationController: UINavigationController
    var flowCompletionHandler: CoordinatorHandler?

    // MARK: - Init

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    // MARK: - Instance methods

    func start() {
        showProfileScene()
    }

    private func showProfileScene() {
        let scene = ProfileViewController()

        scene.completionHandler = { [weak self] authType in
            guard let self = self else { return }
            switch authType {
            case .signIn:
                let module = LoginCoordinator(navigationController: self.navigationController)

                module.flowCompletionHandler = {
                    self.flowCompletionHandler?()
                    self.childDidFinish(module)
                }

                self.childCoordinators.append(module)

                module.start()
            case .signUp:
                let module = RegistrationCoordinator(navigationController: self.navigationController)

                module.flowCompletionHandler = {
                    self.flowCompletionHandler?()
                    self.childDidFinish(module)
                }

                self.childCoordinators.append(module)

                module.start()
            }
        }

        navigationController.setViewControllers([scene], animated: true)
    }
}
