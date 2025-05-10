import SwiftUI

struct TaskCardGrid: View {
    
    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            VStack(spacing: 6) {
                TaskCardView(title: .completed, count: 23, color: .blue, sizeMultiplier: 1.3)
                Spacer()
                TaskCardView(title: .canceled, count: 23, color: .red, sizeMultiplier: 1.0)
            }
            VStack(spacing: 6) {
                TaskCardView(title: .pending, count: 23, color: .purple, sizeMultiplier: 1.0)
                Spacer()
                TaskCardView(title: .onGoing, count: 23, color: .green, sizeMultiplier: 1.3)
            }
        }
    }
}

#Preview {
    TaskCardGrid()
}
