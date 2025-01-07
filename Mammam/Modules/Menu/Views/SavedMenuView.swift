//
//  SavedMenuView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 07/12/24.
//

import SwiftData
import SwiftUI

struct SavedMenuView: View {
    @EnvironmentObject private var coordinator: Coordinator

    @Query(filter: #Predicate<FoodMenu> { menu in
        menu.isSaved == true
    }) private var savedMenus: [FoodMenu]

    let columns = [GridItem(.flexible(), spacing: 16), GridItem(.flexible(), spacing: 16)]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) { // Add spacing between sections
                Text("Saved Menu")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.horizontal) // Add padding for the header

                LazyVGrid(columns: columns, spacing: 24) { // Spacing between rows
                    ForEach(savedMenus) { menu in
                        FoodMenuCardComponent(foodMenu: menu)
                            .padding(8) // Add padding around each card
                            .onTapGesture {
                                coordinator.presentSheet(sheet: .foodMenuDetail(foodMenu: menu))
                            }
                    }
                }
                .padding(.horizontal) // Add padding around the grid
            }
        }
    }
}

#Preview {
    SavedMenuView().modelContainer(for: FoodMenu.self)
}
