import SwiftUI

struct TaskListView: View {
    @StateObject private var viewModel = TaskListViewModel(userId: "aTiuCdJx8TM7beqDf9gEYH7FXnI3")
    
    @State private var currentWeekStart = Calendar.current.startOfWeek(for: Date())
    @State private var selectedDate: Date = Date()
    @State private var searchText: String = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            SearchBarView(searchText: $searchText)
            
            HeaderNavigationView(
                currentWeekStart: $currentWeekStart
            )
            
            WeekDateSelector(
                weekStart: currentWeekStart,
                selectedDate: $selectedDate
            )
            
            TodaySummaryView(date: selectedDate, duration: viewModel.durationForDate(selectedDate))
            
            TaskListSection(
                isLoading: viewModel.isLoading,
                tasks: viewModel.filteredTasks(for: selectedDate, searchText: searchText)
            )
        }
        .onAppear {
            viewModel.loadTasks()
        }
    }
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
