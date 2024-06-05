//
//  MainTabBar.swift
//  curious
//
//  Created by Syam Shukla on 6/4/24.
//

import SwiftUI
import SwiftData


struct MainTabView: View {

    @State private var showSignInView: Bool = false
    var body: some View {
        
        TabView{
            CardStackView()
                .tabItem{
                    Label("Home", systemImage:"brain")
                }
                .tag(0)
            Text("Search View")
                .tabItem{
                    Label("Search", systemImage:"magnifyingglass")
                }
                .tag(1)
//            Text("Profile View")
            UserProfileView(showSignInView: $showSignInView)
                .tabItem {
                    Label("Profile", systemImage:"person")}
                .tag(2)
        }
        
        .tint(.orange)

    }
}
//AIzaSyA3S-gPVgsMGYRFpcvvGGO9NB5pueNwvT8
#Preview {
    MainTabView()
}
