//
//  DashboardViewModel.swift
//  Planer
//
//  Created by Андрей Сорокин on 10.05.2025.
//

import Foundation
import Combine

final class DashboardViewModel: ObservableObject {
    @Published var task: [TaskModel] = []
    @Published var userName: String = "Константин"
    
    // Фильтрованные задачи
     @Published var completedTasks: [TaskModel] = []
     @Published var pendingTasks: [TaskModel] = []
     @Published var onGoingTasks: [TaskModel] = []
     @Published var canceledTasks: [TaskModel] = []
     @Published var todayTasks: [TaskModel] = []
    
    private let tasksService: TaskServiceProtocol
    private let userId = "aTiuCdJx8TM7beqDf9gEYH7FXnI3"
    
    init(tasksService: TaskServiceProtocol = TaskService()) {
        self.tasksService = tasksService
        loadData()
    }
    
    func loadData() {
        tasksService.fetchTasks(for: userId) { [weak self] tasks in
            DispatchQueue.main.async {
                self?.task = tasks
                self?.filterTasks(tasks)
                self?.filterTodayTasks(tasks)
            }
        }
    }
    
    private func filterTasks(_ tasks: [TaskModel]) {
        completedTasks = tasks
            .filter { $0.status == .completed }
            .sorted { $0.startTime < $1.startTime }

        pendingTasks = tasks
            .filter { $0.status == .pending }
            .sorted { $0.startTime < $1.startTime }

        onGoingTasks = tasks
            .filter { $0.status == .onGoing }
            .sorted { $0.startTime < $1.startTime }

        canceledTasks = tasks
            .filter { $0.status == .canceled }
            .sorted { $0.startTime < $1.startTime }
    }
    
    private func filterTodayTasks(_ tasks: [TaskModel]) {
        let calendar = Calendar.current
        todayTasks = tasks
            .filter { calendar.isDateInToday($0.startTime) }
            .sorted { $0.startTime < $1.startTime }
    }
    
    
}
