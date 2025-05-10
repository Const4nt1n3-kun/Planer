import SwiftUI


struct ScheduleView: View {
    let priorityData: [PriorityData] = [
        PriorityData(day: "Mo", value: 8, type: .personal),
        PriorityData(day: "Tu", value: 6, type: .privateTask),
        PriorityData(day: "We", value: 7, type: .secret),
        PriorityData(day: "Th", value: 5, type: .personal),
        PriorityData(day: "Fr", value: 9, type: .privateTask),
        PriorityData(day: "Sa", value: 4, type: .secret),
        PriorityData(day: "Su", value: 6, type: .personal)
    ]
    
    let activityData: [ActivityData] = [
        ActivityData(values: [20, 40, 50], day: "Mo"),
        ActivityData(values: [30, 60, 70], day: "Tu"),
        ActivityData(values: [10, 20, 40], day: "We"),
        ActivityData(values: [40, 50, 60], day: "Th"),
        ActivityData(values: [20, 40, 50], day: "Fr"),
        ActivityData(values: [10, 30, 70], day: "Sa"),
        ActivityData(values: [20, 50, 60], day: "Su")
    ]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("Graphic")
                    .font(.title2)
                    .bold()
                    .padding(.leading)

                PriorityChartView(data: priorityData)

                Text("Your Activity")
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
