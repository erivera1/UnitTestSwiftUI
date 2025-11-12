//
//  UnitTestBootcampViewModel.swift
//  UnitTestSwiftUI
//
//  Created by Eliric on 11/10/25.
//

import Foundation
import SwiftUI
import Combine

class UnitTestBootcampViewModel: ObservableObject {
    @Published var isPremium: Bool
    @Published var dataArray:[String] = []
    @Published var selectedItem: String? = nil
    var cancellables = Set<AnyCancellable>()
    let dataService: NewDataServiceProtocol
    enum DataError: LocalizedError{
        case noData
        case itemNotFound
    }
    
    init(isPremium: Bool, dataService: NewDataServiceProtocol = NewMockDataService(items: nil)) { // ADDED DEFAULT VALUE BUT NOT A GOOD PRACTICE
        self.isPremium = isPremium
        self.dataService = dataService
    }
    
    func addItem(item: String){
        guard !item.isEmpty else { return }
        self.dataArray.append(item)
    }
    
    func selectedItem(item: String){
        if let x = dataArray.first(where: {$0 == item}) {
            selectedItem = x
        } else {
            selectedItem = nil
        }
    }
    
    func saveItem(item:String)throws{
        guard !item.isEmpty else {
            throw DataError.noData
        }
        if let x = dataArray.first(where: {$0 == item}) {
            print("save item here \(x)")
            selectedItem = x
        } else{
            throw DataError.itemNotFound
        }
    }
    
    func downloadWithEscaping(){
        dataService.downloadItemWithEscaping { [weak self] items in
            self?.dataArray = items
        }
    }
    
    func downloadWithCombine(){
        dataService.downloadItemsWithCombine()
            .sink { _ in
                
            } receiveValue: { [weak self] returnedItems in
                self?.dataArray = returnedItems
            }
            .store(in: &cancellables)

    }
}
