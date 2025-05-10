//
//  HeaderNavigationView.swift
//  Planer
//
//  Created by Андрей Сорокин on 17.05.2025.
//

import SwiftUI

struct HeaderNavigationView: View {
    @Binding var currentWeekStart: Date
    
    var body: some View {
        HStack {
            Text("Задачи")
                .font(.title.bold())
            Spacer()
            Button {
                currentWeekStart = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: currentWeekStart)!
            } label: {
                Image(systemName: "chevron.left")
            }
            Text(currentWeekStart.formatted(.dateTime.month().year()))
                .font(.subheadline)
                .foregroundColor(.gray)
            Button {
                currentWeekStart = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: currentWeekStart)!
            } label: {
                Image(systemName: "chevron.right")
            }
        }
        .foregroundStyle(.black)
        .padding(.horizontal)
    }
}



