import SwiftUI

struct TaskListView: View {
    @State private var currentWeekStart = Calendar.current.startOfWeek(for: Date())
    @State private var selectedDate: Date = Date()
    @State private var allTasks: [Date: [TaskModel]] = [:]
    
    var body: some View {
        VStack(alignment: .leading) {
            // Search Bar
                       HStack {
                           TextField("Search for task", text: .constant(""))
                               .padding(10)
                               .background(Color(.systemGray6))
                               .cornerRadius(10)
                           Button(action: {}) {
                               Image(systemName: "magnifyingglass")
                                   .padding()
                           }
                       }.padding(.horizontal)
            // Title & Week nav
                      HStack {
                          Text("Task")
                              .font(.title.bold())
                          Spacer()
                          Button(action: {
                              currentWeekStart = Calendar.current.date(byAdding: .weekOfYear, value: -1, to: currentWeekStart)!
                          }) {
                              Image(systemName: "chevron.left")
                          }
                          Text(currentWeekStart.formatted(.dateTime.month().year()))
                              .font(.subheadline)
                              .foregroundColor(.gray)
                          Button(action: {
                              currentWeekStart = Calendar.current.date(byAdding: .weekOfYear, value: 1, to: currentWeekStart)!
                          }) {
                              Image(systemName: "chevron.right")
                          }
                      }.padding(.horizontal)
            
            // Week selector
                     WeekDateSelector(weekStart: currentWeekStart, selectedDate: $selectedDate)
            
            // Today summary
                        HStack {
                            Text("Today")
                                .font(.title2.bold())
                            Spacer()
                            Text("09 h 45 min")
                                .font(.caption)
                                .foregroundColor(.gray)
                        }.padding(.horizontal)
            // Timeline
                    ScrollView {
                        TaskTimelineView(viewModel: TaskTimelineViewModel())
                            .padding()
                    }
        }
      
    }
    
    
//    // Симуляция загрузки данных
//     func loadTasks(for date: Date) {
//         // Пример задачи
//         let calendar = Calendar.current
//         let hour = calendar.component(.hour, from: date)
//
//         allTasks[date] = [
//            TaskModel(title: "Meeting", timeRange: "\(hour):00", tags: [TaskTag(name: "gas", color: .red)], color: .red),
//            TaskModel(title: "Meeting", timeRange: "\(hour):00", tags: [TaskTag(name: "gas", color: .red)], color: .red)
//         ]
//     }
}
struct WeekDateSelector: View {
    let weekStart: Date
    @Binding var selectedDate: Date
    
    var body: some View {
        let days = (0..<7).map { Calendar.current.date(byAdding: .day, value: $0, to: weekStart)! }
        
        HStack(spacing: 12) {
            ForEach(days, id: \.self) { day in
                let isSelected = Calendar.current.isDate(day, inSameDayAs: selectedDate)
                VStack {
                    Text(day.weekdaySymbol)
                        .font(.caption2)
                    Text(day.dayFormatted)
                        .font(.headline)
                }
                .frame(width: 44, height: 60)
                .background(isSelected ? Color.blue.opacity(0.2) : .clear)
                .cornerRadius(10)
                .onTapGesture {
                    selectedDate = day
                }
            }
        }
        .padding(.horizontal)
    }
}



#Preview {
    
    TaskListView()
}
