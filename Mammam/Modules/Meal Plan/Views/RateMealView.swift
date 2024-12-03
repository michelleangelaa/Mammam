//
//  RateMealView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 16/10/24.
//

import SwiftData
import SwiftUI

struct ExampleRow: View {
    var body: some View {
        Text("Example Row")
    }
}

struct RateMealView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    @State private var ingredient: String = ""
    @State private var type: String = ""
    @State private var timeGiven: Date = .now
    @State private var timeEnded: Date = .now
    @State private var servingUnit: String = "Tea Spoon"
    @State private var servingQty: Double = 1.0
    @State private var consumedQty: Double = 1.0
    @State private var allergic: Bool = false
    @State private var notes: String = ""
    
    var units = ["Tea Spoon", "Table Spoon", "Cup"]

    var body: some View {
        Text("Review Meal")
            .font(.title2).fontWeight(.bold)
        
        Form {
            TextField("Ingredient Name", text: $ingredient)
            TextField("Type", text: $type)
            DatePicker("Time Given", selection: $timeGiven, displayedComponents: .hourAndMinute)
            DatePicker("Time Ended", selection: $timeEnded, displayedComponents: .hourAndMinute)
            HStack {
                Text("Meal serving size")
                Spacer()
                HStack {
                    TextField("Qty", value: $servingQty, format: .number)
                        .keyboardType(.decimalPad)
                        .fixedSize()
                    Picker("", selection: $servingUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .labelsHidden()
                }
               
            }
            HStack {
                Text("Meal consumed")
                Spacer()
                HStack {
                    TextField("Qty", value: $consumedQty, format: .number)
                        .keyboardType(.decimalPad)
                        .fixedSize()
                    Picker("", selection: $servingUnit) {
                        ForEach(units, id: \.self) { unit in
                            Text(unit)
                        }
                    }
                    .labelsHidden()
                }
                
            }
            HStack {
                Text("Allergic Reaction")
                Picker("Allergic Reaction", selection: $allergic) {
                    Text("Yes").tag(true)
                    Text("No").tag(false)
                }
                .pickerStyle(.segmented)
            }
            TextField("Notes", text: $notes)
        }

        
        
        
        

        Button {
            coordinator.dismissSheet()
        } label: {
            Text("back")
        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    RateMealView()
}
