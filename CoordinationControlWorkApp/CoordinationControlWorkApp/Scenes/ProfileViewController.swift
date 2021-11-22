//
//  ProfileViewController.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let buttonHeight: CGFloat = 50
        static let stackViewSpacing: CGFloat = 10
        static let stackViewHorizontalInset: CGFloat = 40
    }

    // MARK: - Instance methods

    private let signInButton: OutlinedButton = {
        let button = OutlinedButton()
        button.setTitle("sign in", for: .normal)
        return button
    }()

    private let signUpButton: UIButton = {
        let button = OutlinedButton()
        button.setTitle("sign up", for: .normal)
        return button
    }()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = Constants.stackViewSpacing
        stack.axis = .vertical
        return stack
    }()

    // MARK: - Instance methods

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupSubviews()
    }

    private func setupSubviews() {
        stackView.addArrangedSubview(signInButton)
        stackView.addArrangedSubview(signUpButton)

        view.addSubview(stackView)

        signInButton.snp.makeConstraints { make in
            make.height.equalTo(Constants.buttonHeight)
        }

        signUpButton.snp.makeConstraints { make in
            make.height.equalTo(Constants.buttonHeight)
        }

        stackView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Constants.stackViewHorizontalInset)
        }
    }
}
