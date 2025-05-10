import SwiftUI

enum SettingOption: CaseIterable {
    case account, theme, language, notifications, deleteAccount, logout

    var title: String {
        switch self {
        case .account: return "Account Settings"
        case .theme: return "Appearance"
        case .language: return "Language"
        case .notifications: return "Notifications"
        case .deleteAccount: return "Delete Account"
        case .logout: return "Log Out"
        }
    }

    var icon: String {
        switch self {
        case .account: return "person.crop.circle"
        case .theme: return "moon.stars"
        case .language: return "globe"
        case .notifications: return "bell"
        case .deleteAccount: return "trash"
        case .logout: return "arrow.backward.square"
        }
    }

    var color: Color {
        switch self {
        case .account: return .blue.opacity(0.2)
        case .theme: return .purple.opacity(0.2)
        case .language: return .green.opacity(0.2)
        case .notifications: return .orange.opacity(0.2)
        case .deleteAccount: return .red.opacity(0.2)
        case .logout: return .gray.opacity(0.2)
        }
    }
}
