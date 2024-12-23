//
//  ProgressView.swift
//  Mammam
//
//  Created by Michelle Angela Aryanto on 21/10/24.
//

import Charts
import SwiftData
import SwiftUI

struct ProgressView: View {
    @Environment(\.modelContext) private var context
    @Query private var nutrients: [Nutrient]

    var body: some View {
        Chart(nutrients, id: \.name) { nutrient in
            SectorMark(
                angle: .value("Count", nutrient.nutrientCount),
                innerRadius: .ratio(0.618),
                angularInset: 1.5
            )
            .cornerRadius(5)
            .foregroundStyle(by: .value("Nutrient", nutrient.name))
        }
        .chartLegend(position: .automatic)
        .chartBackground { chartProxy in
            GeometryReader { geometry in
                if let frame = chartProxy.plotFrame.map({ geometry[$0] }) {
                    VStack {
                        Text("TOTAL")
                        Text("\(nutrients.count) Times")
                    }
                    .position(x: frame.midX, y: frame.midY)
                }
            }
        }
    }
}

#Preview {
    ProgressView()
}
