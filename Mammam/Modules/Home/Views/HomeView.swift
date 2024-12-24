//
//  HomePageView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//
//
import SwiftUI

struct HomeView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @State private var navigateToMotivation = false
    
    var body: some View {
            VStack(alignment: .leading, spacing: 20) {
                // Motivation CTA
                VStack(alignment: .leading, spacing: 12) {
                    Text("Today's Story")
                        .font(.system(size: 17, weight: .bold))
                    
                    Button(action: {
                        coordinator.push(page: .motivation) // Use the Coordinator to navigate
                    }) {
                        ZStack {
                            Image("motivationimage1")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 364, height: 129, alignment: .topLeading)
                                .clipShape(RoundedRectangle(cornerRadius: 18))
                            
                            VStack(alignment: .leading) {
                                Text("#ResponsiveFeeding")
                                    .font(.system(size: 13))
                                    .foregroundColor(Color.theme.secondaryTextColor)
                                    .padding(.top, 40)
                                HStack {
                                    Text("Story Of The Day")
                                        .font(.system(size: 22, weight: .bold))
                                        .padding(.top, 10)
                                        .foregroundColor(Color.theme.secondaryTextColor)
                                    
                                    Spacer()
                                    
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.black)
                                }
                            }
                            .padding(.horizontal, 24)
                            .padding(.vertical, 16)
                        }
                    }
                }

                // Article CTA
                VStack(alignment: .leading, spacing: 12) {
                    Text("Understand Your Child Better")
                        .font(.system(size: 17, weight: .bold))
                    
                    Button(action: {
                        coordinator.presentSheet(sheet: .article) // Show article sheet
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .fill(Color(.systemGray5))
                                .frame(height: 97)
                            
                            HStack(spacing: 20) {
                                Image("motivationimage1")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 65, height: 65, alignment: .topLeading)
                                    .clipShape(RoundedRectangle(cornerRadius: 16))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    HStack(spacing: 5) {
                                        Image(systemName: "book.pages")
                                        Text("Article")
                                            .font(.system(size: 12))
                                    }
                                    
                                    Text("Introduce new food with food chaining")
                                        .font(.system(size: 16))
                                        .frame(maxWidth: .infinity, alignment: .leading)
                                        .fixedSize(horizontal: false, vertical: true)
                                }
                            }
                            .padding()
                        }
                    }
                }
            }
            .padding()
        }
                
        //        CustomLargeButtonComponent(state: .enabled, text: "mau ke profile page") {
        //            coordinator.push(page: .login)
        //        }
//                Button {
//                    coordinator.push(page: .login)
//                } label: {
//                    Text("go to login but profile")
//                }
//                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
        //
    
            
//            .navigationDestination(isPresented: $navigateToMotivation) {
//                MotivationView()
//                    .navigationBarBackButtonHidden(true)
//            }
//        TabBarView()
}

#Preview {
    HomeView()
        .environmentObject(Coordinator())
}
