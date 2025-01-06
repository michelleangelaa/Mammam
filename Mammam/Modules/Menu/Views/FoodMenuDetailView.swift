//
//  FoodMenuDetailView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 03/01/25.
//

import SwiftUI

struct FoodMenuDetailView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context

    var foodMenu: FoodMenu
    
    var body: some View {
        ScrollView {
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
                        HStack {
                            Image(systemName: "exclamationmark.triangle.fill")
                            Text("Allergen")
                        }
                        .foregroundColor(Color.red)
                        HStack {
                            ForEach(allergens) { allergen in
                                Text("\(allergen.name)")
                                    .padding(.horizontal, 12)
                                    .padding(.vertical, 4)
                                    .font(.body)
                                    .foregroundStyle(Color.red)
                                    .background(
                                        RoundedRectangle(cornerRadius: 8)
                                            .fill(Color.rose.rose100)
                                            .stroke(Color.red)
                                    )
                            }
                        }
                    }
                }
                    
                Text(foodMenu.desc)
                    .font(.body)
                    .foregroundColor(.secondary)
                    
                Spacer()
            }
            .padding()
            .navigationTitle("Menu Detail")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Close") {
                        coordinator.dismissSheet()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: { toggleBookmark() }) {
                        Image(systemName: foodMenu.isSaved ? "bookmark.fill" : "bookmark")
                            .font(.subheadline)
                            .padding(8)
                            .padding(8)
                    }
                }
            }
            .onChange(of: foodMenu.isSaved) { _ in
                try? context.save()
            }
        }
    }
    private func toggleBookmark() {
        foodMenu.isSaved.toggle()
        try? context.save()
        print("\(foodMenu.name) bookmark status: \(foodMenu.isSaved)")
    }
}



// #Preview {
//    FoodMenuDetailView()
// }
