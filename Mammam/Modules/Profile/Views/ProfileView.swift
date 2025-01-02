//
//  ProfileView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//

import SwiftUI
import SwiftData

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    
    @Query(sort: \Baby.babyName) private var babies: [Baby]
    @Query(sort: \Allergen.name) private var allergens: [Allergen]
    
    @State private var selectedBaby: Baby?
    
    var body: some View {
        ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        headerSection
                        
                        if let baby = babies.first {
                            babyProfileSection(baby: baby)
                        }
                        
                        if let baby = babies.first {
                            updateBabyProfile(baby: baby)
                        }
                                        
                        
                        if !allergens.isEmpty {
                            updateAllergic
                        }
                        
                        logOut
                        
                        Spacer()
                    }
                    .padding()
                    .navigationBarBackButtonHidden(true)
                }
                .onAppear {
                    selectedBaby = babies.first
                }

    }
    
    // MARK: - Subviews
        
        private var headerSection: some View {
            Text("Update Baby Data")
                .font(.title2)
                .fontWeight(.bold)
        }
        
        private func babyProfileSection(baby: Baby) -> some View {
            HStack(spacing: 12) {
                Circle()
                    .fill(Color.pink.opacity(0.2))
                    .frame(width: 100, height: 100)
//                    ./*overlay(*/
                        //masih salah harusnya krn dia jadi nampilin nama iconnya bukan iconnya
//                        Text(baby.babyProfileImage.isEmpty ? "􀉪" : baby.babyProfileImage)
//                            .font(.system(size: 50))
//                    )
                
                VStack(alignment: .leading, spacing: 4) {
                    Text(baby.babyName)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(calculateAge(birthDate: baby.babyBirthDate))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
        }
        
    private func updateBabyProfile(baby: Baby) -> some View {
            Button(action: {
                coordinator.push(page: .updateProfile(baby: baby))
            }) {
                HStack {
                    Image(systemName: "pencil")
                    Text("Update Baby Profile")
                        .fontWeight(.medium)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            }
        }
        
        private var updateAllergic: some View {
            Button(action: {
                // Implement your navigation logic here
            }) {
                HStack {
                    Image(systemName: "nosign")
                    Text("Food Restriction")
                        .fontWeight(.medium)
                    Spacer()
                    if let baby = babies.first {
                        Text("\(baby.allergen?.count ?? 0) restrictions")
                            .foregroundColor(.gray)
                    }
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            }
        }
        
        private var logOut: some View {
            Button(action: {
                // Implement your navigation logic here
            }) {
                HStack {
                    Image(systemName: "rectangle.portrait.and.arrow.right")
                    Text("Log Out")
                        .fontWeight(.medium)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(UIColor.systemGray6))
                .cornerRadius(10)
            }
        }
        
        // MARK: - Helpers
        private func calculateAge(birthDate: Date) -> String {
            let now = Date()
            let components = Calendar.current.dateComponents([.year, .month], from: birthDate, to: now)
            let years = components.year ?? 0
            let months = components.month ?? 0
            return "\(years) years \(months) months"
        }
}

#Preview {
    ProfileView()
        .environmentObject(Coordinator())
        .modelContainer(for: [Baby.self, Allergen.self], inMemory: true)
}

