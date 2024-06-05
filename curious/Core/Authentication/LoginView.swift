import SwiftUI

struct LoginView: View {
    @State private var loginError: String?
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: SignInEmailView()) {
                    Text("Sign in with Email")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                .navigationTitle("Login")
                .padding()
            }
        }
    }
}

#Preview {
    LoginView()
}
