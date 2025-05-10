import SwiftUI

enum SettingOption: String, CaseIterable, Hashable, Identifiable {
    case account
    case notifications
    case appearance
    case privacy
    case logout

    var id: String { self.rawValue }

    var title: String {
        switch self {
        case .account: return "Учетная запись"
        case .notifications: return "Уведомления"
        case .appearance: return "Оформление"
        case .privacy: return "Конфиденциальность"
        case .logout: return "Выйти"
        }
    }

    var icon: String {
        switch self {
        case .account: return "person.crop.circle"
        case .notifications: return "bell.badge"
        case .appearance: return "paintbrush"
        case .privacy: return "lock.shield"
        case .logout: return "arrow.backward.circle"
        }
    }

    var color: Color {
        switch self {
        case .account: return .blue.opacity(0.2)
        case .notifications: return .orange.opacity(0.2)
        case .appearance: return .purple.opacity(0.2)
        case .privacy: return .red.opacity(0.2)
        case .logout: return .gray.opacity(0.2)
        }
    }
}
