//
//  UnitTestBootcampView.swift
//  UnitTestSwiftUI
//
//  Created by Eliric on 11/10/25.
//

import Foundation
import SwiftUI

struct UnitTestBootcampView: View {
//    @StateObject private var viewModel: UnitTestBootcampViewModel
//    
//    init(isPremium:Bool) {
//        _viewModel = StateObject(wrappedValue: UnitTestBootcampViewModel(isPremium:isPremium))
//    }
    @State var viewModel = UnitTestBootcampViewModel(isPremium: true)
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hellos, worlds! \(viewModel.isPremium)")
        }
        .padding()
    }
}

#Preview {
//    UnitTestBootcampView(isPremium: true)
    UnitTestBootcampView(viewModel: UnitTestBootcampViewModel(isPremium: false))
}
