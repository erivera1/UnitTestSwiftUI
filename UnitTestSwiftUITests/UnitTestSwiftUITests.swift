//
//  UnitTestSwiftUITests.swift
//  UnitTestSwiftUITests
//
//  Created by Eliric on 11/10/25.
//

import Testing
import XCTest
@testable import UnitTestSwiftUI

struct UnitTestSwiftUITests {

    @Test func example() async throws {
        // Write your test here and use APIs like `#expect(...)` to check expected conditions.
    }

    @Test func test_UnitTestingBootcampViewModel_isPremuium_shouldBeTrue(){
        //Given
        let userIsPremium:Bool = false
        //When
        let vm = UnitTestBootcampViewModel(isPremium: userIsPremium)
        //Then
        XCTAssertTrue(vm.isPremium)
    }
}
