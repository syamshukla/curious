import SwiftUI

struct RootView: View {
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack {
                MainTabView(showSignInView: $showSignInView)
            }
        }
        .onAppear {
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
            NotificationCenter.default.addObserver(forName: .didSignIn, object: nil, queue: .main) { _ in
                self.showSignInView = false
            }
        }
        .fullScreenCover(isPresented: $showSignInView) {
            NavigationStack {
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
}
