//
//  SavedMenuViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 31/01/25.
//
import SwiftUI
import SwiftData

class SavedMenuViewModel: ObservableObject {
    @Published var savedMenus: [FoodMenu] = []

    func fetchSavedMenus(context: ModelContext) {
        let descriptor = FetchDescriptor<FoodMenu>(
            predicate: #Predicate<FoodMenu> { menu in
                menu.isSaved == true
            }
        )

        do {
            let fetchedMenus = try context.fetch(descriptor)
            DispatchQueue.main.async {
                self.savedMenus = fetchedMenus
            }
        } catch {
            print("Failed to fetch saved menus: \(error)")
        }
    }

    func toggleSaveStatus(for menu: FoodMenu, context: ModelContext) {
        menu.isSaved.toggle()
        do {
            try context.save()
            DispatchQueue.main.async {
                self.savedMenus.removeAll { $0.id == menu.id } // ✅ Remove if unsaved
                self.objectWillChange.send() // ✅ Force UI update
            }
        } catch {
            print("Failed to update menu: \(error)")
        }
    }
}
