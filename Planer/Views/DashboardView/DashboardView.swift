import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct DashboardView: View {
    @StateObject private var viewModel = DashboardViewModel()
    
    @State private var showTaskList = false
    @State private var selectedStatus: TaskStatus?
    
    
    var body: some View {
            ScrollView {
                VStack(spacing: 12) {
                    //Header
                    HeaderView(name: viewModel.userName, image: "person.circle")
                    
                    TaskCardGrid(viewModel: viewModel) { status in
                        selectedStatus = status
                        showTaskList = true
                    }
                    
                    Spacer()
                    
                    PreviewTaskList(
                        title: "Сегодня",
                        tasks: viewModel.todayTasks
                    )
                }
                .padding()
            }
            .sheet(item: $selectedStatus) { status in
                TaskListStatusView(status: status, tasks: tasks(for: status))
            }
    }
    
    private func tasks(for status: TaskStatus) -> [TaskModel] {
        switch status {
        case .completed: return viewModel.completedTasks
        case .pending: return viewModel.pendingTasks
        case .onGoing: return viewModel.onGoingTasks
        case .canceled: return viewModel.canceledTasks
        }
    }
}

extension TaskStatus: Identifiable {
    var id: String { self.rawValue }
}

#Preview {
    DashboardView()
}
