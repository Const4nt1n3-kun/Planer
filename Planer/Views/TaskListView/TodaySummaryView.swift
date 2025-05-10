//
//  TodaySummaryView.swift
//  Planer
//
//  Created by Андрей Сорокин on 17.05.2025.
//

import SwiftUI

struct TodaySummaryView: View {
    let date: Date
    let duration: String
    
    var body: some View {
        HStack {
            Text("Сегодня")
                .font(.title2.bold())
            Spacer()
            Text(duration)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.horizontal)
    }
}
