//
//  UpdateFoodRestrictionViewModel.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 31/01/25.
//

import SwiftData
import SwiftUI

class UpdateFoodRestrictionViewModel: ObservableObject {
    @Published var allergens: [Allergen] = []

    init() {
//        fetchAllergens()
    }

    func fetchAllergens(context: ModelContext) {
        let fetchDescriptor = FetchDescriptor<Allergen>()
        do {
            let fetchedAllergens = try context.fetch(fetchDescriptor)
            DispatchQueue.main.async {
                self.allergens = fetchedAllergens
            }
        } catch {
            print("Failed to fetch allergens: \(error)")
        }
    }

    func toggleAllergen(_ toggledAllergen: Allergen) {
        if let index = allergens.firstIndex(where: { $0.id == toggledAllergen.id }) {
            allergens[index].isAllergy = toggledAllergen.isAllergy
            allergens[index].image = toggledAllergen.image
        }
    }

    func saveChanges(context: ModelContext) {
        do {
            try context.save()
            print("All allergies updated successfully")
        } catch {
            print("Failed to save changes: \(error)")
        }
    }
}
