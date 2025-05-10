import SwiftUI

struct TimeItervalCardView: View {
    let task: TaskTimelineModel

    var body: some View {
        VStack(alignment: .leading) {
            Text(task.title)
                .font(.headline)
            Text(task.startDate.formatted(date: .omitted, time: .shortened) + " - " +
                 task.endDate.formatted(date: .omitted, time: .shortened))
                .font(.caption)
                .foregroundColor(.gray)

            HStack {
                ForEach(task.tags, id: \.self) { tag in
                    Text(tag)
                        .font(.caption2)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 2)
                        .background(Color.blue.opacity(0.2))
                        .cornerRadius(5)
                }
            }
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 1)
    }
}
#Preview {
    let model = TaskTimelineModel(title: "Test", startDate: Date(), endDate: Date().addingTimeInterval(60), tags: [])
    TimeItervalCardView(task: model)
}
