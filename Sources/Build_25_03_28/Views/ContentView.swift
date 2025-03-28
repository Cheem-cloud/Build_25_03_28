//
import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        Group {
            if authViewModel.isAuthenticated {
                MainTabView()
                    .background(ThemeColors.backgroundGradient)
            } else {
                LoginView()
                    .background(ThemeColors.backgroundGradient)
            }
        }
    }
}

struct MainTabView: View {
    var body: some View {
        TabView {
            Text("Home")
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
                .foregroundColor(ThemeColors.textColor)
            
            Text("Calendar")
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
                .foregroundColor(ThemeColors.textColor)
            
            Text("Settings")
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
                .foregroundColor(ThemeColors.textColor)
        }
        .tint(ThemeColors.textColor)
    }
}

#Preview {
    ContentView()
        .environmentObject(AuthViewModel())
} 
