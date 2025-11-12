//
//  UnitTestSwiftUIApp.swift
//  UnitTestSwiftUI
//
//  Created by Eliric on 11/10/25.
//

import SwiftUI

@main
struct UnitTestSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
//            UnitTestBootcampView(isPremium: true)
//            ContentView()
            UnitTestBootcampView(viewModel: UnitTestBootcampViewModel(isPremium: false))
//            UnitTestBootcampView()
        }
    }
}
