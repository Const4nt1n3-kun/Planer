

import SwiftUI

struct AppearanceSettingsView: View {
    @Environment(\.colorScheme) var colorScheme
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    var body: some View {
          Form {
              Toggle("Темная тема", isOn: $isDarkMode)
                  .onChange(of: isDarkMode) { _ in
                      UIApplication.shared.windows.first?.overrideUserInterfaceStyle = isDarkMode ? .dark : .light
                  }
          }
          .navigationTitle("Оформление")
      }
}

#Preview {
    AppearanceSettingsView()
}
