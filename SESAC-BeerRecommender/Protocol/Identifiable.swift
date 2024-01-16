//
//  Identifiable.swift
//  SESAC-BeerRecommender
//
//  Created by Seryun Chun on 2024/01/16.
//

import Foundation

protocol Identifiable {
    static var identifier: String { get }
}

extension Identifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension NSObject: Identifiable {}
