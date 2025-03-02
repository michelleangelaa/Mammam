//
//  MediumButton.swift
//  Mammam
//
//  Created by Evelyn Santoso on 05/12/24.
//

import SwiftUI


struct CustomMediumButtonComponent: View {
    var state: ButtonState = .disabled
    var text: String = ""
    var action: () -> Void

    var body: some View {
        Button(action: {
            if state == .enabled {
                action()
            }
        }) {
            Text(text)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(Color.theme.secondaryTextColor)
                .frame(width: 331, height: 47)
                .background(backgroundColorButton(for: state))
                .cornerRadius(8)
        }
        .disabled(state == .disabled)
    }
}


// Preview
#Preview {
    VStack {
        CustomMediumButtonComponent(state: .enabled, text:"add to meal plan") {
            print("enabled button tapped")
        }
        
        CustomMediumButtonComponent(state: .disabled, text:"add to meal plan") {
            print("Disabled button tapped")
        }
        
    }
    .padding()
}



