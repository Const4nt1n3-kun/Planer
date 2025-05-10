//
//  SearchBarView.swift
//  Planer
//
//  Created by Андрей Сорокин on 17.05.2025.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            TextField("Поиск по задачам", text: $searchText)
                .padding(10)
                .background(Color(.systemGray6))
                .cornerRadius(10)
            Image(systemName: "magnifyingglass")
                .padding()
                .foregroundStyle(.black)
        }
        .padding(.horizontal)
    }
}

