//
//  curiousApp.swift
//  curious
//
//  Created by Syam Shukla on 5/22/24.
//

import SwiftUI
import SwiftData
import FirebaseCore
import Firebase



@main
struct curiousApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    init() {
         UITabBar.appearance().tintColor = UIColor(named: "AccentColor") // Use the custom color from your asset catalog
        
     }
    
    var body: some Scene {
            WindowGroup {
                RootView()
//                MainTabView()
//                LoginView()
            }
        
        }
    
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
      print("Firebase Configured")
    return true
  }
}
