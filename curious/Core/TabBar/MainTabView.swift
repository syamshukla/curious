//
//  MainTabBar.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import SwiftUI
import SwiftData


struct MainTabView: View {
    @Binding var showSignInView: Bool
    @State private var user: UserModel? = nil
    
    var body: some View {
        TabView {
            CardStackView()
                .tabItem {
                    Label("Home", systemImage: "brain")
                }
                .tag(0)
            Text("Search View")
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
                .tag(1)
            UserProfileView(user: user ?? MockData.users[1], showSignInView: $showSignInView)
                .tabItem {
                    Label("Profile", systemImage: "person")
                }
                .tag(2)

        }
        .onAppear {
            Task {
                user = await fetchUser()
            }
        }
        .tint(.orange)
    }
    
    func fetchUser() async -> UserModel? {
            do {
                let authUser = try AuthenticationManager.shared.getAuthenticatedUser()
                // Placeholder for fetching additional user data if needed
                return UserModel(id: authUser.uid, email: authUser.email, fullname: authUser.email ?? "Unknown", profileImageURL: authUser.photoUrl)
            } catch {
                print("Error fetching authenticated user: \(error)")
                return nil
            }
        }
}

#Preview {
    MainTabView(showSignInView: .constant(false))
}
