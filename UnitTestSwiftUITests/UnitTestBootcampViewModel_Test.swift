//
//  UnitTestBootcampViewModelTemp.swift
//  UnitTestSwiftUITests
//
//  Created by Eliric on 11/11/25.
//

import Testing
import XCTest
import Observation
@testable import UnitTestSwiftUI

//Naming Structure: test_UnitOfWor_StateUnderTest_ExpectedBehavior
//struct UnitTestBootcampViewModelTemp {
//
//    func test_UnitTestingBootcampViewModel_isPremuium_shouldBeTrue(){
//        //Given
//        let userIsPremium:Bool = false
//        //When
//        let vm = UnitTestBootcampViewModel(isPremium: userIsPremium)
//        //Then
//        print(vm.isPremium)
//        XCTAssertTrue(vm.isPremium)
//    }
//}

 class UnitTestBootcampViewModelTemp: XCTestCase {

    func test_isPremium_shouldBeTrue() {
        // Given
        let userIsPremium:Bool = true
        
        //WHEN
        let vm = UnitTestBootcampViewModel(isPremium: userIsPremium)

        // Then
        XCTAssertTrue(vm.isPremium)
    }
     
     func test_isPremium_shouldBeFalse() {
         // Given
         let userIsPremium:Bool = false
         
         //WHEN
         let vm = UnitTestBootcampViewModel(isPremium: userIsPremium)

         // Then
         XCTAssertFalse(vm.isPremium)
     }
     
     func test_isPremium_shouldBeInjectedValue() {
          // Given
         let userIsPremium:Bool = Bool.random()
           
          //WHEN
         let vm = UnitTestBootcampViewModel(isPremium: userIsPremium)

          // Then
         XCTAssertEqual(vm.isPremium, userIsPremium)
     }

}
