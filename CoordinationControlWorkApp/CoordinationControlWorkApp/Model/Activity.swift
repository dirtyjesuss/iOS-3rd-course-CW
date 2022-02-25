//
//  Activity.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import Foundation

struct Activity: Decodable {
    let title: String

    enum CodingKeys: String, CodingKey {
        case title = "activity"
        case type, participants, link, key, accessibility
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decode(String.self, forKey: CodingKeys.title)
    }
}
