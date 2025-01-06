//
//  AccountSuccessView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 02/12/24.
//

import SwiftUI

struct AccountSuccessView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var navigateToOnBoarding = false

    var body: some View {
        ZStack {
            Image("BG_SplashScreen")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            ZStack {
                VStack (alignment: .center, spacing: 16){
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 86)
                        .padding(.bottom, 30)
                    
                    Text("Congratulations! Your account is all set up. ")
                        .font(.title3)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)

                    Text("Now, let’s complete your profile for a more personalized experience. ")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)

                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden()
        .onAppear {
            // Redirect after 3 seconds
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                coordinator.push(page: .registrationForm) // Navigate to onboarding using Coordinator
            }
        }
    }
}

#Preview {
    AccountSuccessView()
}
