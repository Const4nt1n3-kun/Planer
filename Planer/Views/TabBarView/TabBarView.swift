import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationStack {
                DashboardView()
            }
            .tabItem {
                Image(systemName: "magazine")
            }
         
            TaskListView()
                .tabItem {
                    Image(systemName: "list.bullet.clipboard")
                }
            
            ScheduleView()
                .tabItem {
                    Image(systemName: "chart.bar.fill")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.crop.circle")
                }
        }
    }
}

#Preview {
    TabBarView()
}
