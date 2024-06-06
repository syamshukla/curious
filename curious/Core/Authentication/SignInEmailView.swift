//
//  SignInEmailView.swift
//  curious
//
//  Created by Syam Shukla on 6/5/24.
//

import SwiftUI

final class SignInEmailViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    func signIn()  {
        guard !email.isEmpty, !password.isEmpty else{
            print("No email or password found.")
            return
        }
        Task{
            do{
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
                
            } catch{
                print("Error: \(error)")
            }
        }
        
        
    }
}

struct SignInEmailView: View {
    @StateObject private var viewModel = SignInEmailViewModel()
    @State private var signInSuccess = false
    var body: some View {
        
        VStack{
            TextField("Email...", text: $viewModel.email)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            SecureField("Password...", text: $viewModel.password)
                .padding()
                .background(Color.gray.opacity(0.4))
                .cornerRadius(10)
            
            
            Button{
                viewModel.signIn()
            } label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(height:55)
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            Spacer()
        }
        .padding()
        .navigationTitle("Sign in With Email")
        .onChange(of: signInSuccess) { newValue, oldValue in
            if newValue {
                signInSuccess = false // Reset the state after navigation
            }
        }
        .background(
            NavigationLink(
                destination: UserProfileView(user: UserModel(id: "1", email: viewModel.email, fullname: "John Doe", profileImageURL: nil), showSignInView: $signInSuccess),
                isActive: $signInSuccess,
                label: { EmptyView() }
            ).hidden()
        )
    }
}

#Preview {
    NavigationStack{
        SignInEmailView()
    }
}
