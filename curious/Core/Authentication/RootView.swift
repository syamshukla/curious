import SwiftUI

struct RootView: View {
    @StateObject var authManager = AuthenticationManager.shared // Declare it here
    @State private var showSignInView = false
//    var body: some View {
//        ZStack {
//            NavigationStack {
//                MainTabView(showSignInView: $showSignInView)
//            }
//        }
//        .onAppear {
//            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
//            self.showSignInView = authUser == nil
//            NotificationCenter.default.addObserver(forName: .didSignIn, object: nil, queue: .main) { _ in
//                self.showSignInView = false
//            }
//        }
//        .fullScreenCover(isPresented: $showSignInView) {
//            NavigationStack {
//                LoginView()
//            }
//        }
//    }
//}
    var body: some View {
            ZStack {
                NavigationStack {
                    if authManager.isSignedIn {
                        MainTabView(showSignInView: $showSignInView)
                            .environmentObject(authManager) // Inject here
                    } else {
                        LoginView()
                            .environmentObject(authManager) // Inject here as well
                    }
                }
            }
            .onAppear {
                let authUser = try? authManager.getAuthenticatedUser()
                authManager.isSignedIn = authUser != nil
            }
        }
    }
struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(AuthenticationManager.shared)
    }
}
   
