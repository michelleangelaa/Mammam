//
//  QuestionChoiceComponent.swift
//  Mammam
//
//  Created by Evelyn Santoso on 05/12/24.
//

import SwiftUI

struct QuestionChoiceComponent: View {
    // Customizable text properties
        let buttonText1: String
        let buttonText2: String
        let actions: [() -> Void]

    var body: some View {
        VStack {
            ZStack(alignment: .topLeading){
                Rectangle()
                    .fill(Color.theme.backgroundColor)
                    .cornerRadius(20)
                    .frame(width: 361, height: 185)
                
                Text("What Should I Do?")
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(Color.theme.primaryTextColor)
                    .padding([.top, .leading], 19)
                
                VStack(spacing: 14) {
                    CustomMediumButtonComponent(state: .enabled, text: buttonText1) {
                        // Trigger first action
                            if actions.indices.contains(0) {
                                actions[0]()
                            }
                        
                    }
                    
                    CustomMediumButtonComponent(state: .enabled, text: buttonText2) {
                        // Trigger sec action
                        if actions.indices.contains(1) {
                            actions[1]()
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.top, 56)
            }.frame(width: 361, height: 185)
        }
               
    }
}

//#Preview {
//    QuestionChoiceComponent(
//            buttonText1: "Get Mad",
//            buttonText2: "Encourage the Kid",
//            actions: [
//                { print("Get Mad tapped") },
//                { print("Encourage the Kid tapped") }
//            ]
//    )
//}

