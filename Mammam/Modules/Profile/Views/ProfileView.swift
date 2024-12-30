//
//  ProfileView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//
//
//import SwiftUI
//
//struct ProfileView: View {
//    @EnvironmentObject private var coordinator: Coordinator
//
//    var body: some View {
//        Text("This is profile page")
////        Button {
////            coordinator.presentSheet(sheet: .forgotPassword)
////        } label: {
////            Text("forgot password")
////        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//
//    }
//}
//
//#Preview {
//    ProfileView()
//}
//import SwiftUI
//import SwiftData
//
//struct ProfileView: View {
//    @Query(sort: \Baby.babyName) var babies: [Baby] // Fetch all Baby records
//    @EnvironmentObject private var coordinator: Coordinator
//    @State private var babydatatoEdit : Baby?
//
//    var body: some View {
//        VStack {
//            if let baby = babies.first { // Assuming there's only one baby for now
//                VStack(spacing: 20) {
//                    // Baby Profile Header
//                    HStack {
////                        if !baby.babyAvatar.isEmpty {
////                                Circle()
////                                .fill(Color.pink.opacity(0.2))
////                                .frame(width: 50, height: 50)
////                                .overlay(
////                                Text(baby.babyAvatar)
////                                .font(.system(size: 30))
////                                )
////                        } else {
////                             Default "person" icon if no avatar is selected
//                            Image("i_profile_person")
//                                .resizable()
//                                .scaledToFit()
//                                .frame(width: 50, height: 50)
//                                .foregroundColor(.pink)
////                        }
//                       
//                        
//                        VStack(alignment: .leading) {
//                            Text(baby.babyName)
//                                .font(.title)
//                                .fontWeight(.bold)
//                            let (years, months) = calculateBabyAge(from: baby.babyBirthDate)
//                                Text("\(years) years \(months) months")
//                                        .font(.subheadline)
//                                        .foregroundColor(.gray)
//                        }
//                        Spacer()
//                    }
//                    .padding()
//                    
//                     //Update Baby Profile Button
//                    NavigationLink(destination: UpdateBabyProfileView(baby: baby)) {
//                        HStack {
//                            Image(systemName: "pencil")
//                            Text("Update Baby Profile")
//                                .fontWeight(.medium)
//                        }
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color(UIColor.systemGray6))
//                        .cornerRadius(10)
//                    }
//                    
//                    // Food Restrictions
//                    NavigationLink(destination: UpdateAFoodRestriction(baby: baby)) {
//                        HStack {
//                            Image(systemName: "nosign")
//                            Text("Food Restriction")
//                                .fontWeight(.medium)
//                            Spacer()
//                            Text("\(baby.allergen?.count ?? 0) restrictions")
//                                .foregroundColor(.gray)
//                        }
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color(UIColor.systemGray6))
//                        .cornerRadius(10)
//                    }
//
//                    // Log Out Button
//                    Button(action: {
//                        // Handle log out
//                    }) {
//                        HStack {
//                            Image(systemName: "rectangle.portrait.and.arrow.right")
//                            Text("Log Out")
//                                .fontWeight(.medium)
//                        }
//                        .padding()
//                        .frame(maxWidth: .infinity)
//                        .background(Color(UIColor.systemGray6))
//                        .cornerRadius(10)
//                    }
//                }
//                .padding()
//            } else {
//                Text("Loading baby profile...")
//                    .padding()
//            }
//        }
//        .navigationTitle("Profile")
//        .navigationBarTitleDisplayMode(.inline)
//    }
//    
//    // Helper function to calculate baby age
//
//    func calculateBabyAge(from birthDate: Date) -> (Int, Int) {
//           let calendar = Calendar.current
//           let components = calendar.dateComponents([.year, .month], from: birthDate, to: Date())
//           
//           let years = components.year ?? 0
//           let months = components.month ?? 0
//           
//           return (years, months)
//       }
//}
//
import SwiftUI
import SwiftData



struct ProfileView: View {
    var user : User
    @ObservedObject var coordinator: Coordinator // Pass the coordinator to handle navigation

    var body: some View {
        VStack {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 60, height: 60)
                    .foregroundColor(.pink)

                VStack(alignment: .leading) {
                    Text(user.firstName, user.lastName)
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("\(user.) month\(user.ageInMonths > 1 ? "s" : "")")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()

            List {
                Button(action: {
                    coordinator.push(page: .updateProfile)
                }) {
                    HStack {
                        Image(systemName: "pencil")
                        Text("Update Baby Profile")
                    }
                }

                Button(action: {
                    coordinator.push(page: .foodRestrictions)
                }) {
                    HStack {
                        Image(systemName: "nosign")
                        Text("Food Restriction")
                        Spacer()
                        Text("\(user.foodRestrictions.count) restriction\(user.foodRestrictions.count > 1 ? "s" : "")")
                            .foregroundColor(.gray)
                            .font(.subheadline)
                    }
                }

                Button(action: {
                    // Handle logout logic
                    print("User logged out")
                }) {
                    HStack {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                        Text("Log Out")
                            .foregroundColor(.red)
                    }
                }
            }
            .listStyle(InsetGroupedListStyle())

            Spacer()
        }
        .navigationTitle("Profile")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct UpdateProfileView: View {
    @Binding var user: User

    var body: some View {
        Text("Update Profile View")
            .navigationTitle("Update Profile")
    }
}

struct FoodRestrictionsView: View {
    let restrictions: [String]

    var body: some View {
        List(restrictions, id: \.self) { restriction in
            Text(restriction)
        }
        .navigationTitle("Food Restrictions")
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(coordinator: Coordinator())
    }
}
