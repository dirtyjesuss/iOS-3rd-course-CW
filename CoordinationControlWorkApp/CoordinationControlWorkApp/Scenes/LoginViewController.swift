//
//  LoginViewController.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import UIKit

class LoginViewController: UIViewController, FlowController {

    // MARK: - Constants

    private enum Constants {
        static let buttonHeight: CGFloat = 30
        static let buttonHorizontalInset: CGFloat = 60
        static let topOffset: CGFloat = 10
        static let textFieldHorizontalInset: CGFloat = 60
        static let textFieldHeight: CGFloat = 50
    }

    // MARK: - Instance properties

    var completionHandler: ((()) -> Void)?

    private var loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter login"
        return textField
    }()

    private var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter password"
        return textField
    }()

    private let nextButton: OutlinedButton = {
        let button = OutlinedButton()
        button.setTitle("next", for: .normal)
        button.addTarget(self, action: #selector(nextButtonOnTap), for: .touchUpInside)
        return button
    }()

    // MARK: - Instance methods

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupSubviews()
    }

    private func setupSubviews() {
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)

        loginTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.textFieldHorizontalInset)
            make.bottom.equalTo(passwordTextField.snp.top).offset(-Constants.topOffset)
            make.height.equalTo(Constants.textFieldHeight)
        }

        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.textFieldHorizontalInset)
            make.centerY.equalToSuperview()
            make.height.equalTo(Constants.textFieldHeight)
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Constants.topOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.buttonHorizontalInset)
            make.height.equalTo(Constants.buttonHeight)
        }
    }

    // MARK: - Actions

    @objc private func nextButtonOnTap() {
        guard
            let login = loginTextField.text,
            let password = passwordTextField.text,
            !login.isEmpty && !password.isEmpty
        else {
            return
        }

        completionHandler?(())
    }
}
