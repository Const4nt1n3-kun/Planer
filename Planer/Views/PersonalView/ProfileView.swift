import SwiftUI

struct CategoryModel: Identifiable {
    let id = UUID()
    let title: String
    let taskCount: Int
    let icon: String
    let color: Color
    
}

struct SettingRow: View {
    let option: SettingOption
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                Image(systemName: option.icon)
                    .foregroundColor(.primary)
                    .frame(width: 32, height: 32)
                    .background(option.color)
                    .clipShape(Circle())
                
                Text(option.title)
                    .font(.body)
                
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
            .padding()
            .background(Color(.systemBackground))
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.05), radius: 4, x: 0, y: 2)
        }
    }
}




struct ProfileView: View {
    let user = UserModel(name: "Konstantine", email: "ConstantineGoit@gmail.com", createdAt: Date.now)
    
    @State private var showLogoutConfirm = false
    @State private var showDeleteConfirm = false
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            ScrollView {
                VStack(spacing: 24){
                    ProfileHeaderView(user: user)
                    
                    SettingsSectionView(options: SettingOption.allCases) { option in
                        handleTap(option)
                    }
                }
                .padding()
                
            }
            .navigationDestination(for: SettingOption.self) { option in
                destination(for: option)
            }
            .confirmationDialog("Вы уверены, что хотите выйти?", isPresented: $showLogoutConfirm, titleVisibility: .visible) {
                Button("Выйти", role: .destructive) {
                    AuthService.shared.signOut { result in
                        print(result)
                    }
                }
                Button("Отмена", role: .cancel) {}
            }
            .confirmationDialog("Удалить аккаунт навсегда?", isPresented: $showDeleteConfirm, titleVisibility: .visible) {
                Button("Удалить аккаунт", role: .destructive) {
                    AuthService.shared.deleteAccount { result in
                        print(result)
                    }
                }
                Button("Отмена", role: .cancel) {}
            }
            
        }
    }
    
    
    private func handleTap(_ option: SettingOption) {
        switch option {
        case .logout:
            showLogoutConfirm = true
        default:
            path.append(option)
        }
    }
    
    @ViewBuilder
    private func destination(for option: SettingOption) -> some View {
        switch option {
        case .account:
            AccountSettingsView(showDeleteConfirm: $showDeleteConfirm)
        case .notifications:
            NotificationSettingsView()
        case .appearance:
            AppearanceSettingsView()
        case .privacy:
            PrivacySettingsView()
        case .logout:
            EmptyView()
        }
    }
}

#Preview {
    ProfileView()
}


struct SettingsSectionView: View {
    let options: [SettingOption]
    let onSelect: (SettingOption) -> Void
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(options, id: \.self) { option in
                SettingRow(option: option) {
                    onSelect(option)
                }
            }
        }
        .padding(.horizontal)
    }
}

struct ProfileHeaderView: View {
    let user: UserModel
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            
            Text(user.name)
                .font(.title2)
                .bold()
            
            Text(user.email)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

//struct AccountSettingsView: View {
//    @Binding var showDeleteConfirm: Bool
//
//    var body: some View {
//        Form {
//            Section(header: Text("Учетная запись")) {
//                Button("Удалить аккаунт", role: .destructive) {
//                    showDeleteConfirm = true
//                }
//            }
//        }
//        .navigationTitle("Аккаунт")
//    }
//}

import SwiftUI

struct AccountSettingsView: View {
    @State private var name: String = "Konstantine"
    @State private var email: String = "ConstantineGoit@gmail.com"
    @State private var phone: String = "+7 (900) 123-45-67"
    @State private var showingSaveAlert = false
    @Binding var showDeleteConfirm: Bool
    
    var body: some View {
        Form {
            Section(header: Text("Личная информация")) {
                TextField("Имя пользователя", text: $name)
                    .autocapitalization(.words)
                
                TextField("Email", text: $email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                
                TextField("Телефон", text: $phone)
                    .keyboardType(.phonePad)
            }
            
            Section {
                Button(action: saveChanges) {
                    Text("Сохранить изменения")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            Section(header: Text("Учетная запись")) {
                Button("Удалить аккаунт", role: .destructive) {
                    showDeleteConfirm = true
                }
                .frame(maxWidth: .infinity, alignment: .center)
            }
        }
        .navigationTitle("Учетная запись")
        .alert("Изменения сохранены", isPresented: $showingSaveAlert) {
            Button("ОК", role: .cancel) { }
        }
    }
    
    private func saveChanges() {
        // Здесь будет логика сохранения (например, через ViewModel + Firebase)
        showingSaveAlert = true
    }
}
