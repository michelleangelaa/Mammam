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
    @Query private var baby: [Baby]
    @Query private var allergen: [Allergen] // Query for articles


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
            HStack(spacing: 12){
                
                Circle()
                    .fill(Color.pink.opacity(0.2))
                    .frame(width: 100, height: 100)
                    .overlay(
                        Text(baby.first?.babyProfileImage.isEmpty ?? true ? "􀉪" : baby.first?.babyProfileImage ?? "")
                        .font(.system(size: 50))
                    )
                
                VStack(alignment: .leading, spacing: 4){
                    Text(baby.first?.babyName ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                    Text("\(calculateAge(birthDate: baby.first?.babyBirthDate ?? Date()))")
                        .font(.subheadline)
                       .foregroundColor(.gray)
                }
            }
            Spacer()
        }
    }
        
    
    private var  updateBabyProfile: some View {
        Button(action: {
            coordinator.push(page: .updateProfile)
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
    
    private var  updateAllergic : some View {
        Button(action: {
            coordinator.push(page: .foodRestrictions)
        }) {
//            if let allergens = allergen.first{
                HStack {
                    Image(systemName: "nosign")
                    Text("Food Restriction")
                        .fontWeight(.medium)
                    Spacer()
//                    Text("\(baby.allergens.count ?? 0) restrictions")
                    Text("\(baby.first?.allergen?.count ?? 0) restrictions")
                        .foregroundColor(.gray)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color(Color.gray100))
                .cornerRadius(10)
            }
        }
    
   
    private var  logOut : some View {
        Button(action: {
            coordinator.push(page: .account)
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
}
