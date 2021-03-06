//
//  ActivityService.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import Foundation
import Combine


final class ActivityService {

    // MARK: - Instance properties

    var publisher: AnyPublisher<Activity, Never> {
        subject.eraseToAnyPublisher()
    }

    private let subject = PassthroughSubject<Activity, Never>()

    private let session = URLSession.shared
    private let decoder = JSONDecoder()
    private var cancellable: AnyCancellable?

    private var url: URL {
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else {
            fatalError("Base url is not configured")
        }

        return url
    }

    // MARK: - Instance methods
    func fetchData() {
        cancellable = session.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Activity?.self, decoder: decoder)
            .replaceError(with: nil)
            .compactMap { $0 }
            .sink { [weak self] in
                self?.subject.send($0)
            }
    }
}
