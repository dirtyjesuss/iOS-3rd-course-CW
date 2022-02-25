//
//  OutlinedButton.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import UIKit

class OutlinedButton: UIButton {

    // MARK: - Constants

    private enum Constants {
        static let buttonBorderWidth: CGFloat = 1
    }

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupStyle()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Instance methods

    override func layoutSubviews() {
        layer.cornerRadius = bounds.height / 4.0
        super.layoutSubviews()
    }

    private func setupStyle() {
        layer.masksToBounds = true
        layer.borderWidth = Constants.buttonBorderWidth
        layer.borderColor = UIColor.black.cgColor
        setTitleColor(.black, for: .normal)
    }
}
