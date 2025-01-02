//
//  UpdateFoodRestrictionView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 02/01/25.
//

import SwiftUI
import SwiftData

struct UpdateFoodRestrictionView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    @Bindable var baby: Baby

    @State private var selectedAllergens: Set<Allergen> = []

    // Allergen samples
    private let allergens = Allergen.sampleAllergens

    var body: some View {
        VStack(spacing: 20) {
            Text("Update Allergies")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            // List of allergens
            List(allergens, id: \.self) { allergen in
                HStack {
                    Text(allergen.name)
                    Spacer()
                    Toggle(isOn: Binding(
                        get: { selectedAllergens.contains(allergen) },
                        set: { isSelected in
                            if isSelected {
                                selectedAllergens.insert(allergen)
                            } else {
                                selectedAllergens.remove(allergen)
                            }
                        }
                    )) {
                        Text("")
                    }
                    .toggleStyle(SwitchToggleStyle())
                }
            }
            .padding(.top)

            Spacer()

            // Update Button
            Button(action: {
                updateAllergens()
            }) {
                Text("Update Allergens")
                    .font(.title2)
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .navigationTitle("Update Allergies")
        .navigationBarTitleDisplayMode(.inline)
    }

    // Save selected allergens
    private func updateAllergens() {
        baby.allergen = Array(selectedAllergens)
        do {
            try modelContext.save() // Save changes to the context
            dismiss()
        } catch {
            print("Failed to save allergens: \(error.localizedDescription)")
        }
    }
}

//#Preview {
//    UpdateFoodRestrictionView()
//
//}
