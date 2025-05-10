import SwiftUI

struct PreviewTaskList: View {
    let title: String
    let tasks: [TaskModel]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text(title)
                    .font(.title2)
                    .bold()
            }
            ForEach(tasks, id: \.id) { task in
                TaskItemView(task: task)
            }
            
        }
    }
}

#Preview {
    let tasks: [TaskModel] = [
        TaskModel(
            title: "First",
            descriprion: "asdasd", startTime: Date.now,
            endTime: Date.now.addingTimeInterval(3600),
            tags: [
                "фыв"
            ],
            status: .completed,
            colorHex: "",
            ownerId: "",
            createdAt: Date.now,
            updatedAt: Date.now
        )
    ]
    PreviewTaskList(title: "Today Task", tasks: tasks)
}
