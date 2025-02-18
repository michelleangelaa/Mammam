//
//  SavedMenuView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import SwiftData
import SwiftUI

struct SavedMenuView: View {
    @Environment(\.modelContext) private var context
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject private var viewModel = SavedMenuViewModel()

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Saved Menu")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal)

                if viewModel.savedMenus.isEmpty {
                    VStack(spacing: 16) {
                        Spacer()
                        Image(systemName: "bookmark.slash")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        Text("No saved menus yet.")
                            .font(.body)
                            .foregroundColor(.gray)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                } else {
                    LazyVGrid(columns: [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)], spacing: 24) {
                        ForEach(viewModel.savedMenus) { menu in
                            FoodMenuCardComponent(foodMenu: menu)
                                .padding(8)
                                .onTapGesture {
                                    coordinator.presentSheet(sheet: .foodMenuDetail(foodMenu: menu)) // ✅ Match the caller
                                }
                                .contextMenu {
                                    Button(role: .destructive) {
                                        viewModel.toggleSaveStatus(for: menu, context: context) // ✅ Remove if unsaved
                                    } label: {
                                        Label("Unsave", systemImage: "trash")
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                }
            }
        }
        .onAppear {
            viewModel.fetchSavedMenus(context: context)
        }
    }
}
