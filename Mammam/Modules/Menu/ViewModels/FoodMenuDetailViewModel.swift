//
//  FoodMenuDetailViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 31/01/25.
//

import SwiftData
import SwiftUI

class FoodMenuDetailViewModel: ObservableObject {
    @Published var foodMenu: FoodMenu

    init(foodMenu: FoodMenu) {
        self.foodMenu = foodMenu
    }

    func toggleBookmark(context: ModelContext) {
        foodMenu.isSaved.toggle()
        saveChanges(context: context)
        print("\(foodMenu.name) bookmark status: \(foodMenu.isSaved)")
    }

    private func saveChanges(context: ModelContext) {
        do {
            try context.save()
        } catch {
            print("Error saving context: \(error.localizedDescription)")
        }
    }
}
