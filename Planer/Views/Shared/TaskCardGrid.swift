import SwiftUI

struct TaskCardGrid: View {
    @ObservedObject var viewModel: DashboardViewModel
    
    var onTap: (TaskStatus) -> Void
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(spacing: 6) {
                TaskCardView(title: .completed, count: viewModel.completedTasks.count, color: .blue, sizeMultiplier: 1.3) {
                    onTap(.completed)
                }
                Spacer()
                TaskCardView(title: .canceled, count: viewModel.canceledTasks.count, color: .red, sizeMultiplier: 1.0){
                    onTap(.canceled)
                }
            }
            VStack(spacing: 6) {
                TaskCardView(title: .pending, count: viewModel.pendingTasks.count, color: .purple, sizeMultiplier: 1.0){
                    onTap(.pending)
                }
                Spacer()
                TaskCardView(title: .onGoing, count: viewModel.onGoingTasks.count, color: .green, sizeMultiplier: 1.3){
                    onTap(.onGoing)
                }
            }
        }
    }
}

#Preview {
    TaskCardGrid(viewModel: DashboardViewModel(), onTap: {_ in })
}
