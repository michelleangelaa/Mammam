//
//  AllergyCardComponent.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 04/01/25.
//

import SwiftUI

struct AllergyCardComponent: View {
    @State var allergen: Allergen
    var onToggle: (Allergen) -> Void

    var body: some View {
        Button(action: {
            allergen.isAllergy.toggle()
            onToggle(allergen)
        }) {
            VStack(spacing: 2) { // Add spacing between the image and the text
                ZStack {
                    RoundedRectangle(cornerRadius: 20, style: .continuous)
                        .fill(Color(UIColor.systemGray6))
                        .frame(width: 85, height: 85)
                    
                    Image(allergen.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())

                }

                Text(allergen.name)
                    .font(.footnote)
                    .foregroundColor(allergen.isAllergy ? Color.white : Color.black)
                    .padding(.bottom, 10)
            }
            .frame(width: 85, height: 105)
            .background(
                RoundedRectangle(cornerRadius: 20, style: .continuous)
                    .foregroundColor(allergen.isAllergy ? Color.pink : Color.gray) // Text color
//                    .fill(Color(UIColor.systemGray5)) // Background for the entire card
            )
//            .overlay(
//                RoundedRectangle(cornerRadius: 20)
//                    .foregroundColor(allergen.isAllergy ?  Color.pink : Color.gray) // Text color
//            )
        }
//            VStack {
//                Image(allergen.image)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 40, height: 40)
//
//                Text(allergen.name)
//                    .font(.caption)
//                    .fontWeight(.bold)
//            }
//            .padding()
//            .frame(maxWidth: .infinity)
//            .background(allergen.isAllergy ? Color.pink.opacity(0.2) : Color.gray.opacity(0.1))
//            .cornerRadius(10)
//            .overlay(
//                RoundedRectangle(cornerRadius: 10)
//                    .stroke(allergen.isAllergy ? Color.pink : Color.gray, lineWidth: 2)
//            )
    }
}

// #Preview {
//    AllergyCardComponent()
// }
