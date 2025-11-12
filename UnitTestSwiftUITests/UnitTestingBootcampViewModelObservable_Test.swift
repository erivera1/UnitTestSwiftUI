//
//  UnitTestingBootcampViewModelTest_temp.swift
//  UnitTestSwiftUITests
//
//  Created by Eliric on 11/11/25.
//

import XCTest
import Combine
import Observation
@testable import UnitTestSwiftUI

 class UnitTestingBootcampViewModelObservable_Test_temp: XCTestCase {
     func test_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium:Bool = true
        
        //WHEN
        let vm = UnitTestBootcampViewModelObservable(isPremium: userIsPremium)

        // Then
        XCTAssertTrue(vm.isPremium)
     }
     
     func test_isPremium_shouldBeFalse() {
        // Given
        let userIsPremium:Bool = false
         
        //WHEN
        let vm = UnitTestBootcampViewModelObservable(isPremium: userIsPremium)

        // Then
        XCTAssertFalse(vm.isPremium)
     }
 
     func test_isPremium_shouldBeInjectedValue() {
         // Given
        let userIsPremium:Bool = Bool.random()
          
         //WHEN
        let vm = UnitTestBootcampViewModelObservable(isPremium: userIsPremium)

         // Then
        XCTAssertEqual(vm.isPremium, userIsPremium)
     }
     
     func test_isPremium_shouldBeInjectedValue_stress() {
         for _ in 0..<100{
             // Given
            let userIsPremium:Bool = Bool.random()
              
             //WHEN
            let vm = UnitTestBootcampViewModelObservable(isPremium: userIsPremium)

             // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
         }
     }
}
