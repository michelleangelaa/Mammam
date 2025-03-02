//
//  UpdateFoodRestrictionView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 02/01/25.
//

import SwiftData
import SwiftUI

struct UpdateFoodRestrictionView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @StateObject private var viewModel = UpdateFoodRestrictionViewModel()

    var body: some View {
        VStack {
            Text("Update Food Restriction")
                .font(.title2)
                .fontWeight(.bold)
                .padding(.top)

            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 16), count: 3), spacing: 16) {
                ForEach(viewModel.allergens) { allergen in
                    AllergyCardComponent(allergen: .constant(allergen)) { toggledAllergen in
                        viewModel.toggleAllergen(toggledAllergen)
                    }
                }
            }
            .padding()

            Spacer()

            Button(action: {
                viewModel.saveChanges(context: context)
                dismiss()
            }) {
                Text("Update Baby's Allergies")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.pink)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .padding(.horizontal)
        .onAppear {
            viewModel.fetchAllergens(context: context) // ✅ Pass context
        }
    }
}
