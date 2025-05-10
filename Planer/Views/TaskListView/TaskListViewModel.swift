//
//  TaskListViewModel.swift
//  Planer
//
//  Created by Андрей Сорокин on 17.05.2025.
//

import Foundation

final class TaskListViewModel: ObservableObject{
    @Published var allTasksByDate: [Date: [TaskModel]] = [:]
    @Published var isLoading: Bool = false
    
    private let taskService: TaskServiceProtocol
    private let userId: String
    
    init(userId: String, taskService: TaskServiceProtocol = TaskService()) {
        self.taskService = taskService
        self.userId = userId
        loadTasks()
    }
    
    func loadTasks() {
         isLoading = true
         taskService.fetchTasks(for: userId) { [weak self] tasks in
             DispatchQueue.main.async {
                 self?.groupTasksByDate(tasks)
                 self?.isLoading = false
             }
         }
     }
    
    private func groupTasksByDate(_ tasks: [TaskModel]) {
           let calendar = Calendar.current
           let grouped = Dictionary(grouping: tasks) { task in
               calendar.startOfDay(for: task.startTime)
           }

           // Сортировка по дате (опционально)
           self.allTasksByDate = grouped.mapValues { $0.sorted { $0.startTime < $1.startTime } }
       }

       func tasks(for date: Date) -> [TaskModel] {
           let day = Calendar.current.startOfDay(for: date)
           return allTasksByDate[day] ?? []
       }
    
    func filteredTasks(for date: Date, searchText: String) -> [TaskModel] {
        let day = Calendar.current.startOfDay(for: date)
        let tasksForDay = allTasksByDate[day] ?? []

        if searchText.isEmpty {
            return tasksForDay
        }

        return tasksForDay.filter {
            $0.title.localizedCaseInsensitiveContains(searchText) ||
            $0.descriprion.localizedCaseInsensitiveContains(searchText)
        }
    }
    
    func durationForDate(_ date: Date) -> String {
        let calendar = Calendar.current
        let key = calendar.startOfDay(for: date)
        let tasks = allTasksByDate[key] ?? []

        let totalSeconds = tasks.reduce(0) { $0 + $1.endTime.timeIntervalSince($1.startTime) }
        let hours = Int(totalSeconds) / 3600
        let minutes = (Int(totalSeconds) % 3600) / 60

        return String(format: "%02d ч %02d мин", hours, minutes)
    }
}
