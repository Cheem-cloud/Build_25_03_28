import SwiftUI
import FirebaseAuth
import GoogleSignIn

@_exported import struct CheemHang_03_25.ThemeColors

struct LoginView: View {
    @EnvironmentObject private var authViewModel: AuthViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome to CheemHang")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(ThemeColors.textColor)
            
            Text("Please sign in to continue")
                .font(.subheadline)
                .foregroundColor(ThemeColors.secondaryText)
            
            if let error = authViewModel.error {
                Text(error.localizedDescription)
                    .foregroundColor(.red)
                    .font(.caption)
                    .multilineTextAlignment(.center)
                    .padding()
            }
            
            Button(action: {
                Task {
                    await authViewModel.signInWithGoogle()
                }
            }) {
                HStack {
                    Image(systemName: "g.circle.fill")
                        .foregroundColor(.blue)
                    Text("Sign in with Google")
                        .foregroundColor(.primary)
                }
                .padding()
                .background(Color(.systemBackground))
                .cornerRadius(8)
            }
            .padding()
        }
        .padding()
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthViewModel())
} 