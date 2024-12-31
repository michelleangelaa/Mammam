////
////  AccountSuccessView.swift
////  Mammam
////
////  Created by Michelle Angela Aryanto on 02/12/24.
////
//
//import SwiftUI
//
//struct AccountSuccessView: View {
//    @EnvironmentObject private var coordinator: Coordinator
//    @State private var navigateToOnBoarding = false
//
//    var body: some View {
//        NavigationStack {
//            VStack(alignment: .center, spacing: 10) {
//                Image(systemName: "checkmark.seal.fill")
//                    .font(.system(size: 100))
//                Text("Congratulations! Your account is all set up. ")
//                    .font(.title)
//                    .fontWeight(.bold)
//                Text("Now, let’s complete your profile for a more personalized experience. ")
//                    .font(.body)
//            }
//            .padding()
//            .onAppear {
//                // Redirect after 3 seconds
//                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
////                    coordinator.push(page: .onBoarding) // Navigate to onboarding using Coordinator
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    AccountSuccessView()
//}
