import Foundation
import FirebaseAuth

extension Notification.Name {
    static let didSignIn = Notification.Name("didSignIn")
}

struct AuthDataResultModel {
    let uid: String
    let email: String?
    let photoUrl: String?
    
    init(user: User) {
        self.uid = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}

final class AuthenticationManager: ObservableObject {
    static let shared = AuthenticationManager()
    @Published var isSignedIn: Bool = false
    private init() { let authUser = try? getAuthenticatedUser()
        self.isSignedIn = authUser != nil
        
        // Listen for authentication state changes
        Auth.auth().addStateDidChangeListener { _, user in
            self.isSignedIn = user != nil
        }
    }
    
    func createUser(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().createUser(withEmail: email, password: password)
        NotificationCenter.default.post(name: .didSignIn, object: nil)
        return AuthDataResultModel(user: authDataResult.user)
    }
    
    func getAuthenticatedUser() throws -> AuthDataResultModel {
        guard let user = Auth.auth().currentUser else {
            throw URLError(.badServerResponse)
        }
        return AuthDataResultModel(user: user)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func signIn(email: String, password: String) async throws -> AuthDataResultModel {
        let authDataResult = try await Auth.auth().signIn(withEmail: email, password: password)
        NotificationCenter.default.post(name: .didSignIn, object: nil)
        return AuthDataResultModel(user: authDataResult.user)
    }
}
