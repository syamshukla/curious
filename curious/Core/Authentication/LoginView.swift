//
//  LoginView.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import SwiftUI
import _AuthenticationServices_SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    var body: some View {
            NavigationStack {
                VStack {
                    SignInWithAppleButton(
                        .signIn,
                        onRequest: { request in
                            let nonce = viewModel.randomNonceString()
                            viewModel.currentNonce = nonce
                            request.requestedScopes = [.fullName, .email]
                            request.nonce = viewModel.sha256(nonce)
                        },
                        onCompletion: { result in
                            switch result {
                            case .success(let authorization):
                                viewModel.handleAuthorization(authorization)
                            case .failure(let error):
                                print("Sign in with Apple failed: \(error.localizedDescription)")
                            }
                        }
                    )
                    .signInWithAppleButtonStyle(.black)
                    .frame(width: 280, height: 45)
                    
                    
                    NavigationLink{
                        SignInEmailView()
                    } label: {
                        Text("Sign In With Email")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(width:280, height:45)
                            .background(Color.blue)
                            .cornerRadius(10)
                            
                    }
                    
                }
                
                .navigationTitle("Login")
            }
        }
    }


#Preview {
    LoginView()
}
