//
//  FoodMenuDetailView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 03/01/25.
//

import SwiftUI

struct FoodMenuDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    var foodMenu: FoodMenu
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Image(foodMenu.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                
                Text(foodMenu.name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .multilineTextAlignment(.leading)
                
                if let allergens = foodMenu.allergens, !allergens.isEmpty {
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Allergens")
                            .font(.headline)
                        ForEach(allergens) { allergen in
                            Text("- \(allergen.name)")
                                .font(.body)
                        }
                    }
                }
                
                Text(foodMenu.desc)
                    .font(.body)
                    .foregroundColor(.secondary)
                
                Spacer()
            }
            .padding()
            .navigationTitle("Menu Details")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        coordinator.dismissSheet()
                    }
                }
            }
        }
    }
}

// #Preview {
//    FoodMenuDetailView()
// }
