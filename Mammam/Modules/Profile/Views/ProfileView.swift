//
//  ProfileView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//

import SwiftData
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @Environment(\.modelContext) private var context
    @Query private var babies: [Baby]
    @Query private var allergens: [Allergen]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                // profile
                headerSection
                
                showBabyProfile
                
                // update baby profile
                updateBabyProfile
                
                // update allergic
                updateAllergic
                
                // log out
                logOut
                
                Spacer()
            }
            .padding()
            .navigationBarBackButtonHidden(true)
        }
    }
    
    // MARK: - Subviews

    private var headerSection: some View {
        Text("Update Baby Data")
            .font(.title2)
            .fontWeight(.bold)
    }
    
    private var showBabyProfile: some View {
        VStack(alignment: .leading, spacing: 12) {
            if let currentBaby = babies.first {
                HStack(spacing: 12) {
                    Circle()
                        .fill(Color.pink.opacity(0.2))
                        .frame(width: 100, height: 100)
                        .overlay(
                            Text(currentBaby.babyProfileImage.isEmpty ? "􀉪" : currentBaby.babyProfileImage)
                                .font(.system(size: 50))
                        )
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text(currentBaby.babyName)
                            .font(.title)
                            .fontWeight(.bold)
                        Text(calculateAge(birthDate: currentBaby.babyBirthDate))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }
            Spacer()
        }
    }
    
    private var updateBabyProfile: some View {
        Button(action: {
            if let currentBaby = babies.first {
                coordinator.push(page: .updateProfile(baby: currentBaby))
            }
        }) {
            HStack {
                Image(systemName: "pencil")
                Text("Update Baby Profile")
                    .fontWeight(.medium)
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(UIColor.systemGray6))
            .cornerRadius(10)
        }
        .disabled(babies.isEmpty)
    }
    
    private var updateAllergic: some View {
        Button(action: {
            if let currentBaby = babies.first {
                coordinator.push(page: .foodRestrictions(baby: currentBaby))
            }
        }) {
            HStack {
                Image(systemName: "nosign")
                Text("Food Restriction")
                    .fontWeight(.medium)
                Spacer()
                Text("\(allergens.filter { $0.isAllergy }.count) restrictions")
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(Color.gray100))
            .cornerRadius(10)
        }
    }
    
    private var logOut: some View {
        Button(action: {
             coordinator.push(page: .account)
        }) {
            HStack {
                Image(systemName: "rectangle.portrait.and.arrow.right")
                Text("Log Out")
                    .fontWeight(.medium)
                Spacer()
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
}
