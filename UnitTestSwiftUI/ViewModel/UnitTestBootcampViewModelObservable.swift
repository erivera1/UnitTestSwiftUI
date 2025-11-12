//
//  UnitTestBootcampViewModelObservable.swift
//  UnitTestSwiftUI
//
//  Created by Eliric on 11/11/25.
//


import Foundation
import SwiftUI
import Combine


@Observable
class UnitTestBootcampViewModelObservable {
    var isPremium: Bool

    init(isPremium: Bool) {
        self.isPremium = isPremium
    }
}