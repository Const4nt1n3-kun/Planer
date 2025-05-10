import SwiftUI

struct TagModel: Identifiable, Codable, Hashable {
    var id: String = UUID().uuidString
    var title: String
    var colorHex: String
}


enum TaskStatus: String, Codable {
    case completed
    case canceled
    case pending
    case onGoing
    
    var localizedTitle: String {
        switch self {
        case .completed:
            "Завершены"
        case .canceled:
            "Отменены"
        case .pending:
            "В процесе"
        case .onGoing:
            "Исполняются"
        }
    }
}

extension Color {
    init?(hex: String) {
        var hexFormatted = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if hexFormatted.hasPrefix("#") { hexFormatted.removeFirst() }

        guard hexFormatted.count == 6,
              let rgb = UInt64(hexFormatted, radix: 16) else { return nil }

        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255,
            green: Double((rgb & 0x00FF00) >> 8) / 255,
            blue: Double(rgb & 0x0000FF) / 255
        )
    }
}
