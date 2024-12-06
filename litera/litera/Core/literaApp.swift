//
//  literaApp.swift
//  litera
//
//  Created by Angelina Chen on 12/2/24.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct literaApp: App {
    // register app delegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authService = AuthService()
    
    var body: some Scene {
        WindowGroup {
            GetStartedView()
//            RegistrationView()
//                .environmentObject(authService)
        }
    }
}
