import SwiftUI


struct ScheduleView: View {
    let priorityData: [PriorityData] = [
        PriorityData(day: "Пн", value: 8, type: .personal),
        PriorityData(day: "Вт", value: 6, type: .privateTask),
        PriorityData(day: "Ср", value: 7, type: .secret),
        PriorityData(day: "Чт", value: 5, type: .personal),
        PriorityData(day: "Пт", value: 9, type: .privateTask),
        PriorityData(day: "Сб", value: 4, type: .secret),
        PriorityData(day: "Вс", value: 6, type: .personal)
    ]
    
    let activityData: [ActivityData] = [
        ActivityData(values: [20, 40, 50], day: "Пн"),
        ActivityData(values: [30, 60, 70], day: "Вт"),
        ActivityData(values: [10, 20, 40], day: "Ср"),
        ActivityData(values: [40, 50, 60], day: "Чт"),
        ActivityData(values: [20, 40, 50], day: "Пт"),
        ActivityData(values: [10, 30, 70], day: "Сб"),
        ActivityData(values: [20, 50, 60], day: "Вс")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("График")
                    .font(.title2)
                    .bold()
                    .padding(.leading)

                PriorityChartView(data: priorityData)

                Text("Активность")
                    .font(.title2)
                    .bold()
                    .padding(.leading)

                ActivityView(data: activityData)
            }
            .padding()
        }
        .background(Color(UIColor.systemGray6).edgesIgnoringSafeArea(.all))
    }
}



struct PriorityData: Identifiable {
    let id = UUID()
    let day: String
    let value: Int
    let type: PriorityType
}

enum PriorityType: String {
    case personal = "Personal"
    case privateTask = "Private"
    case secret = "Secret"
}

struct ActivityData: Identifiable {
    let id = UUID()
    let values: [CGFloat]
    let day: String
}





#Preview {
    ScheduleView()
}
