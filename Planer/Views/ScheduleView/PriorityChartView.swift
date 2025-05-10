import SwiftUI

struct PriorityChartView: View {
    var data: [PriorityData]
    let timeIntervals = ["10", "08", "06", "04", "02"] // Временные метки
    
    var body: some View {
        VStack(alignment: .leading) {
            // Заголовок
            Text("Priority")
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(.black)
            
            // Легенда
            HStack {
                LegendView(color: .red, text: "Personal")
                LegendView(color: .blue, text: "Private")
                LegendView(color: .cyan, text: "Secret")
            }
            .padding(.bottom, 5)

            // График
            HStack(alignment: .top, spacing: 8) {
                // Временной интервал (слева)
                VStack(alignment: .trailing) {
                    ForEach(timeIntervals, id: \.self) { time in
                        Text(time)
                            .font(.caption)
                            .foregroundColor(.black)
                            .frame(height: 24) // Расстояние между метками
                    }
                }

                // График данных (справа)
                HStack(alignment: .bottom, spacing: 16) {
                    ForEach(data) { item in
                        VStack {
                            Spacer()
                            Circle()
                                .fill(colorForType(item.type))
                                .frame(width: 12, height: 12)
                                .opacity(0.8)
                                .padding(.bottom, CGFloat(item.value * 5))
                            
                            Text(item.day)
                                .font(.caption)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                    }
                }
            }
            .padding(.top, 10)
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: 5)
    }
    
    private func colorForType(_ type: PriorityType) -> Color {
        switch type {
        case .personal: return .red
        case .privateTask: return .blue
        case .secret: return .cyan
        }
    }
}

#Preview {
    let data = [
        PriorityData(day: "s", value: 12, type: .personal)
    ]
    PriorityChartView(data: data)
}
