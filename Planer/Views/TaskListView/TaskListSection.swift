//
//  TaskListSection.swift
//  Planer
//
//  Created by Андрей Сорокин on 17.05.2025.
//

import SwiftUI

struct TaskListSection: View {
    let isLoading: Bool
    let tasks: [TaskModel]
    
    var body: some View {
        ScrollView {
            if isLoading {
                ProgressView().padding()
            } else if tasks.isEmpty {
                Text("Нет задач по вашему запросу")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                VStack(spacing: 16) {
                    ForEach(tasks) { task in
                        TaskItemView(task: task)
                    }
                }
                .padding()
            }
        }
    }
}

