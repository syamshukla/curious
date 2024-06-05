//
//  RootView.swift
//  curious
//
//  Created by Syam Shukla on 6/5/24.
//

import SwiftUI

struct RootView: View {
    @State private var showSignInView: Bool = false
    
    var body: some View {
        ZStack {
            NavigationStack{
                MainTabView()
            }
        }
        .onAppear{
            let authUser = try? AuthenticationManager.shared.getAuthenticatedUser()
            self.showSignInView = authUser == nil
            
        }
        .fullScreenCover(isPresented: $showSignInView){
            NavigationStack{
                LoginView()
            }
        }
    }
}

#Preview {
    RootView()
}
