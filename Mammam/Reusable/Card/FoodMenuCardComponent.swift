//
//  FoodMenuCardComponent.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 25/12/24.
//

import SwiftData
import SwiftUI

struct FoodMenuCardComponent: View {
    @Environment(\.modelContext) private var context
    @ObservedObject var foodMenu: FoodMenu
    @EnvironmentObject private var coordinator: Coordinator
    @State private var showingUnsaveAlert = false

//
//    @Binding var foodMenu: FoodMenu
//    @State private var isBookmarked: Bool
//
//    init(foodMenu: Binding<FoodMenu>) {
//        self._foodMenu = foodMenu
//        self._isBookmarked = State(initialValue: foodMenu.wrappedValue.isSaved)
//    }

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(foodMenu.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .frame(width: 140, height: 140)

                Button(action: {
                    if foodMenu.isSaved {
                        showingUnsaveAlert = true
                    } else {
                        toggleBookmark()
                    }
                }) {
                    Image(systemName: foodMenu.isSaved ? "bookmark.fill" : "bookmark")
                        .font(.title3)
                        .padding(8)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
                        .padding(8)
                }
            }

            Text(foodMenu.name)
                .font(.caption2)
                .multilineTextAlignment(.leading)
                .foregroundColor(.primary)
                .lineLimit(2)

            Spacer()
        }
        .onChange(of: foodMenu.isSaved) { _ in
            try? context.save()
        }
        .padding(.bottom, 8)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.systemGray6))
        )
        .padding(.horizontal, 8)
        .alert("Unsave Menu", isPresented: $showingUnsaveAlert) {
            Button("Cancel", role: .cancel) {}
            Button("Unsave", role: .destructive) {
                toggleBookmark()
            }
        } message: {
            Text("Are you sure you want to unsave the menu?")
        }
    }

//    private func toggleBookmark() {
//        isBookmarked.toggle()
//        foodMenu.isSaved = isBookmarked
//        try? context.save()
//        print("\(foodMenu.name) bookmark status: \(isBookmarked)")
//    }

    private func toggleBookmark() {
        foodMenu.isSaved.toggle()
        try? context.save()
        print("\(foodMenu.name) bookmark status: \(foodMenu.isSaved)")
    }
}

//
// #Preview {
//    let previewContext = try! ModelContainer(for: FoodMenu.self)
//    let sampleMenu = FoodMenu(
//        name: "Sample Menu",
//        image: "sample_image",
//        isSaved: false,
//        desc: "Delicious meal description",
//        ingredients: [],
//        allergens: []
//    )
//    return FoodMenuCardComponent(foodMenu: .constant(sampleMenu))
//        .environment(\.modelContext, previewContext)
// }
