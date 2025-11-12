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