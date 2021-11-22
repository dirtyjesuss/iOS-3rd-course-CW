//
//  MainViewController.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import UIKit
import Combine

class MainViewController: UIViewController, FlowController {

    // MARK: - Constants

    private enum Constants {
        static let font = UIFont.systemFont(ofSize: 20, weight: .regular)
        static let textLabelHorizontalInset: CGFloat = 30
        static let topOffset: CGFloat = 10
    }

    // MARK: - Instance properties

    var completionHandler: ((()) -> Void)?

    var service: ActivityService?

    private var cancellables: [AnyCancellable] = []

    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = Constants.font
        label.textAlignment = .center
        label.numberOfLines = .zero
        return label
    }()

    private let fetchButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.link, for: .normal)
        button.setTitle("Fetch activity", for: .normal)
        button.addTarget(self, action: #selector(fetchButtonOnTap), for: .touchUpInside)
        return button
    }()

    private let logoutButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.black, for: .normal)
        button.setTitle("log out", for: .normal)
        button.addTarget(self, action: #selector(logoutButtonOnTap), for: .touchUpInside)
        return button
    }()


    // MARK: - Instance methods

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupNavigationBar()
        setupSubviews()
        setupSubscriptions()
    }

    private func setupNavigationBar() {
        title = "Activities"
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    private func setupSubviews() {
        view.addSubview(textLabel)
        view.addSubview(fetchButton)
        view.addSubview(logoutButton)

        textLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(Constants.textLabelHorizontalInset)
        }

        fetchButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(textLabel.snp.bottom).offset(Constants.topOffset)
        }

        logoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(fetchButton.snp.bottom).offset(Constants.topOffset)
        }
    }

    private func setupSubscriptions() {
        guard let service = service else {
            return
        }

        service.publisher
            .receive(on: DispatchQueue.main)
            .sink { [weak self] activity in
                self?.textLabel.text = activity.title
            }
            .store(in: &cancellables)
    }

    // MARK: - Actions

    @objc private func fetchButtonOnTap() {
        service?.fetchData()
    }

    @objc private func logoutButtonOnTap() {
        completionHandler?(())
    }
}
