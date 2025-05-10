import SwiftUI


class TaskTimelineViewModel: ObservableObject {
    @Published var tasks: [TaskTimelineModel] = []
    
    init() {
        loadSampleTasks()
    }
    
    func tasks(for hour: Int) -> [TaskTimelineModel] {
        tasks.filter {
            Calendar.current.component(.hour, from: $0.startDate) == hour
        }
    }
    
    private func loadSampleTasks() {
        let calendar = Calendar.current
        let today = Date()
        
        tasks = [
            TaskTimelineModel(
                title: "Cleaning Clothes",
                startDate: calendar.date(bySettingHour: 10, minute: 0, second: 0, of: today)!,
                endDate: calendar.date(bySettingHour: 10, minute: 30, second: 0, of: today)!,
                tags: ["Urgent", "Home"]
            ),
            TaskTimelineModel(
                title: "Cleanwing Clothes",
                startDate: calendar.date(bySettingHour: 10, minute: 0, second: 0, of: today)!,
                endDate: calendar.date(bySettingHour: 10, minute: 30, second: 0, of: today)!,
                tags: ["Urgent", "Home"]
            ),
            TaskTimelineModel(
                title: "Team Meeting",
                startDate: calendar.date(bySettingHour: 13, minute: 0, second: 0, of: today)!,
                endDate: calendar.date(bySettingHour: 14, minute: 0, second: 0, of: today)!,
                tags: ["Work"]
            )
        ]
    }
}


struct TaskTimelineView: View {
    @ObservedObject var viewModel: TaskTimelineViewModel
    private let sectionHeight: CGFloat = 120
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            ForEach(Array(stride(from: 10, through: 20, by: 2)), id: \.self) { hour in
                let tasksAtHour = viewModel.tasks(for: hour)
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("\(hour):00")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    if tasksAtHour.isEmpty {
                        HStack {
                            Text("You don’t have any schedule")
                                .foregroundColor(.gray)
                            Spacer()
                            Button("+ Add", action: {})
                                .font(.caption)
                        }
                        .padding(.horizontal)
                    } else {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 12) {
                                ForEach(tasksAtHour) { task in
                                    TimeItervalCardView(task: task)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
            .frame(height: sectionHeight)
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.1)),
                alignment: .bottom
            )
        }
    }
}

#Preview {
    let viewModel = TaskTimelineViewModel()
    TaskTimelineView(viewModel: viewModel)
}
