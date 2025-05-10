import SwiftUI

// Легенда для обозначений
struct LegendView: View {
    var color: Color
    var text: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(color)
                .frame(width: 10, height: 10)
            Text(text)
                .font(.caption)
        }
    }
}

#Preview {
    LegendView(color: .red, text: "as")
}
