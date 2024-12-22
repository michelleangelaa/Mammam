//
//  DatabaseInitializer.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 20/12/24.
//

import SwiftData

// kasih tau dari nama ingredients

func setupSampleIngredients(context: ModelContext) {
    // Check if any ingredients already exist
    let descriptor = FetchDescriptor<Ingredient>()
    if let existingIngredients = try? context.fetch(descriptor), !existingIngredients.isEmpty {
        print("Sample ingredients already exist in the database.")
        return
    }

    // Insert sample ingredients
    Ingredient.sampleIngredients.forEach { ingredient in
        context.insert(ingredient)
    }

    // Save changes to persist data
    try? context.save()
    print("Sample ingredients have been added to the database.")
}
