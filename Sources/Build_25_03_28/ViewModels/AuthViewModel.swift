import SwiftUI
import FirebaseAuth
import GoogleSignIn

@MainActor
class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var isAuthenticated = false
    @Published var error: Error?
    
    private let whitelistedEmails = [
        "samcrocker09@gmail.com",
        "kendall.m.crocker@gmail.com"
    ]
    
    init() {
        setupAuthStateListener()
    }
    
    private func setupAuthStateListener() {
        Auth.auth().addStateDidChangeListener { [weak self] _, user in
            self?.user = user
            self?.isAuthenticated = user != nil
        }
    }
    
    func signInWithGoogle() async {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let window = windowScene.windows.first,
              let rootViewController = window.rootViewController else {
            return
        }
        
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
            guard let idToken = result.user.idToken?.tokenString else { return }
            
            let credential = GoogleAuthProvider.credential(
                withIDToken: idToken,
                accessToken: result.user.accessToken.tokenString
            )
            
            let authResult = try await Auth.auth().signIn(with: credential)
            
            // Check if the user's email is whitelisted
            if let email = authResult.user.email {
                if whitelistedEmails.contains(email) {
                    self.user = authResult.user
                    self.isAuthenticated = true
                } else {
                    // Sign out if email is not whitelisted
                    try await Auth.auth().signOut()
                    self.error = NSError(domain: "AuthError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Email not authorized"])
                }
            }
        } catch {
            self.error = error
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
            GIDSignIn.sharedInstance.signOut()
            self.user = nil
            self.isAuthenticated = false
        } catch {
            self.error = error
        }
    }
} 