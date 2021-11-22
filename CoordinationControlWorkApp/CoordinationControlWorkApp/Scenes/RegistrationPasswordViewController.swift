//
//  RegistrationPasswordViewController.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import UIKit

class RegistrationPasswordViewController: UIViewController, FlowController {

    // MARK: - Constants

    private enum Constants {
        static let buttonHeight: CGFloat = 30
        static let buttonHorizontalInset: CGFloat = 60
        static let buttonTopOffset: CGFloat = 10
        static let loginTextFieldHorizontalInset: CGFloat = 40
        static let loginTextFieldHeight: CGFloat = 50
    }

    // MARK: - Instance properties

    var completionHandler: ((()) -> Void)?

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
        view.addSubview(passwordTextField)
        view.addSubview(nextButton)

        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(Constants.loginTextFieldHorizontalInset)
            make.centerY.equalToSuperview()
            make.height.equalTo(Constants.loginTextFieldHeight)
        }

        nextButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Constants.buttonTopOffset)
            make.leading.trailing.equalToSuperview().inset(Constants.buttonHorizontalInset)
            make.height.equalTo(Constants.buttonHeight)
        }
    }

    // MARK: - Actions

    @objc private func nextButtonOnTap() {
        guard let text = passwordTextField.text,
           !text.isEmpty
        else {
            return
        }

        completionHandler?(())
    }
}
