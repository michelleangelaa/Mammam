//
//  FoodMenuCardComponent.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 25/12/24.
//

import SwiftData
import SwiftUI

struct FoodMenuCardComponent: View {
    var foodMenu: FoodMenu

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(foodMenu.image)
                    .resizable()
                    .scaledToFill()
//                    .frame(width: 200, height: 175)
                    .clipShape(RoundedRectangle(cornerRadius: 16))

                // Bookmark Icon
                Button(action: {
                    print("Bookmark tapped for \(foodMenu.name)")
                }) {
                    Image(systemName: "bookmark")
                        .font(.title3)
                        .padding(8)
                        .background(Color.white.opacity(0.8))
                        .clipShape(Circle())
//                        .shadow(radius: 2)
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
        .padding(.vertical, 8)
//        .frame(width: 200, height: 220)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(UIColor.systemGray6))
        )
        .padding(.horizontal, 8)
    }
}

#Preview {
    
}
