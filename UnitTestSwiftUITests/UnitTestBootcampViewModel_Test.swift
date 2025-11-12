//
//  UnitTestBootcampViewModelTemp.swift
//  UnitTestSwiftUITests
//
//  Created by Eliric on 11/11/25.
//

import Testing
import XCTest
import Observation
import Combine
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

 class UnitTestBootcampViewModel_Test: XCTestCase {
     var viewModel:  UnitTestBootcampViewModel?
     var cancellables = Set<AnyCancellable>()
     override func setUpWithError() throws{
         viewModel = UnitTestBootcampViewModel(isPremium: Bool.random())
     }
     
     override func tearDownWithError() throws {
         viewModel = nil
     }

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

     func test_isPremium_shouldBeInjectedValue_stress() {
         for _ in 0..<100{
             // Given
            let userIsPremium:Bool = Bool.random()
              
             //WHEN
            let vm = UnitTestBootcampViewModel(isPremium: userIsPremium)

             // Then
            XCTAssertEqual(vm.isPremium, userIsPremium)
         }
     }
     
     func test_dataArray_shouldBeEmpty(){
         //When
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         //Then
         XCTAssertTrue(vm.dataArray.isEmpty)
         XCTAssertEqual(vm.dataArray.count, 0)
     }
     
     func test_dataArray_shouldAddItems(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         //When
         let loopCount: Int = Int.random(in: 1..<100)
         for _ in 0..<loopCount{
             let uuid = UUID().uuidString
             print(uuid)
             vm.addItem(item: uuid)
         }
         
         //Then
         XCTAssertTrue(!vm.dataArray.isEmpty)
         XCTAssertFalse(vm.dataArray.isEmpty)
         XCTAssertNotEqual(vm.dataArray.count, 0)
         XCTAssertGreaterThan(vm.dataArray.count, 0)
     }
     
     func test_dataArray_shouldNotAddBlankItems(){
         //Given
         guard let vm = viewModel else {
             XCTFail()
             return
         }
         //When
         vm.addItem(item: "")
         //Then
         XCTAssertTrue(vm.dataArray.isEmpty)
     }
     
     func test_dataArray_shouldNotAddBlankItems2(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         //When
         vm.addItem(item: "")
         //Then
         XCTAssertTrue(vm.dataArray.isEmpty)
     }
     
     func test_dataArray_shouldStartAsNil(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         //When
         vm.addItem(item: "")
         //Then
         XCTAssertTrue(vm.selectedItem == nil)
         XCTAssertNil(vm.selectedItem)
     }
     
     func test_selectedItem_shouldSBeNilWhenSelectingInvalidItem(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         //When
         //SELECT VALID ITEM
         let newItem = UUID().uuidString
         vm.addItem(item: newItem)
         vm.selectedItem(item: newItem)
         //SELECT INVALID ITEM
         vm.selectedItem(item:  UUID().uuidString)
         //Then
         
         XCTAssertNil(vm.selectedItem)
     }
     
     func test_selectedItem_shouldSBeSelected(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         //When
         let newItem = UUID().uuidString
         vm.addItem(item: newItem)
         vm.selectedItem(item: newItem)
         //Then
         
         XCTAssertNotNil(vm.selectedItem)
         XCTAssertEqual(vm.selectedItem, newItem)
     }
     
     func test_selectedItem_shouldSBeSelected_stress(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         //When
         let loopCount: Int = Int.random(in: 1..<100)
         var itemsArray: [String] = []
         for _ in 0..<loopCount{
             let newItem = UUID().uuidString
             vm.addItem(item: newItem)
             itemsArray.append(newItem)
         }
         let randomItem = itemsArray.randomElement() ?? ""
         XCTAssertFalse(randomItem.isEmpty)
         vm.selectedItem(item: randomItem)
         //Then
         
         XCTAssertNotNil(vm.selectedItem)
         XCTAssertEqual(vm.selectedItem, randomItem)
     }
     
     func test_saveItem_shouldThrowError_itemNotFound(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         
         //When
         let loopCount: Int = Int.random(in: 1..<100)
         for _ in 0..<loopCount{
             vm.addItem(item: UUID().uuidString)
         }
         //THEN
         XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString))
         
         XCTAssertThrowsError(try vm.saveItem(item: UUID().uuidString),"Should throw Item Not Found error"){ error in
             let returnError = error as? UnitTestBootcampViewModel.DataError
             XCTAssertEqual(returnError, UnitTestBootcampViewModel.DataError.itemNotFound)
         }
     }
     
     func test_saveItem_shouldThrowError_NoData(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         
         //When
         let loopCount: Int = Int.random(in: 1..<100)
         for _ in 0..<loopCount{
             vm.addItem(item: UUID().uuidString)
         }
         //THEN
         do{
             try vm.saveItem(item: "")
         } catch {
             let returnError = error as? UnitTestBootcampViewModel.DataError
             XCTAssertEqual(returnError, UnitTestBootcampViewModel.DataError.noData)
         }
     }
     
     func test_saveItem_shouldSaveItem(){
         //Given
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         
         //When
         let loopCount: Int = Int.random(in: 1..<100)
         var itemsArray: [String] = []
         for _ in 0..<loopCount{
             let newItem = UUID().uuidString
             vm.addItem(item: newItem)
             itemsArray.append(newItem)
         }
         
         //THEN
         let randomItem = itemsArray.randomElement() ?? ""
         XCTAssertFalse(randomItem.isEmpty)
         XCTAssertNoThrow(try vm.saveItem(item: randomItem))
         
         do{
             try vm.saveItem(item: randomItem)
         } catch {
             XCTFail()
         }
     }
     
     func test_downloadWithEscaping_shouldReturnItem_withCombine(){
         //Given
//         let vm = UnitTestBootcampViewModel(isPremium: Bool.random())
         
         let items = [UUID().uuidString, UUID().uuidString, UUID().uuidString, UUID().uuidString, UUID().uuidString]
         let dataService: NewDataServiceProtocol = NewMockDataService(items: items)
         let vm = UnitTestBootcampViewModel(isPremium: Bool.random(), dataService: dataService)
         
         //When
         let expectation = XCTestExpectation(description: "Should Return Items after 3 seconds")
         vm.$dataArray
             .dropFirst()
             .sink{ returnedItems in
                 expectation.fulfill()
             }
             .store(in: &cancellables)
//         vm.downloadWithEscaping()
         vm.downloadWithCombine()
         
         //THEN
         wait(for: [expectation], timeout: 5)
         XCTAssertGreaterThan(vm.dataArray.count, 0)
         XCTAssertEqual(vm.dataArray.count, items.count)
     }
}
