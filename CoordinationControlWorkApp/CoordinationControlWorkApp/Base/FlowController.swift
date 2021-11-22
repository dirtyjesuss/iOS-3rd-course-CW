//
//  FlowController.swift
//  CoordinationControlWorkApp
//
//  Created by Ruslan Khanov on 22.11.2021.
//

import Foundation

protocol FlowController {

    associatedtype T
    var completionHandler: ((T) -> Void)? { get set }
}
