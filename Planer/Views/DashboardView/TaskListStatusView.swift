import SwiftUI

struct TaskListStatusView: View {
    let status: TaskStatus
    let tasks: [TaskModel]
    
    var body: some View {
        NavigationStack {
            List(tasks) { task in
                TaskItemView(task: task)
            }
           
            .navigationTitle(status.localizedTitle)
        }
    }
}

#Preview {
    let status = TaskStatus.completed
    let tasks = [
        TaskModel(title: "", descriprion: "", startTime: Date.now, endTime: Date.now, tags: [], status: .completed, colorHex: "", ownerId: "", createdAt: Date.now, updatedAt: Date.now)
    ]
    TaskListStatusView(status: status, tasks: tasks)
}
