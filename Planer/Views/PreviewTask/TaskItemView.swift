import SwiftUI

struct TaskItemView: View {
    let task: TaskModel
    
    var body: some View {
           HStack(alignment: .top) {
               Rectangle()
                   .fill(Color.init(hex: task.colorHex) ?? Color.white )
                   .frame(width: 4)
                   .cornerRadius(2)

               VStack(alignment: .leading, spacing: 8) {
                   Text(task.title)
                       .font(.headline)
                       .foregroundColor(.gray)
                   
                   Text(task.startTime.timeString())
                       .font(.headline)
                       .foregroundColor(.black)
                   
                   Text(task.descriprion)
                       .font(.subheadline)
                       .foregroundColor(.gray)
                   
//                   HStack(spacing: 8) {
//                       ForEach(task.tags) { tag in
//                           TaskTagView(tag: tag)
//                       }
//                   }
               }

               Spacer()

               Image(systemName: "ellipsis")
                   .foregroundColor(.gray)
           }
           .padding()
           .background(Color(.systemGray6))
           .cornerRadius(16)
       }
}

#Preview {
    let tasks =
        TaskModel(
            title: "Firsлорлоt",
            descriprion: "asdafsd", startTime: Date.now,
            endTime: Date.now.addingTimeInterval(3600),
            tags: [
                "фыв"
            ],
            status: .completed,
            colorHex: "#9EFFFF",
            ownerId: "",
            createdAt: Date.now,
            updatedAt: Date.now
        )
    
    TaskItemView(task: tasks)
}
