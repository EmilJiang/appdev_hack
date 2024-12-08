//
//  ContentView.swift
//  litera
//
//  Created by Angelina Chen on 12/2/24.
//

import SwiftUI
import UIKit

struct ContentView: View {
    @EnvironmentObject var authService: AuthService
    
    
    var body: some View {
        TabView {
            // Home View
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                }
            
            // Search View
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
                }
            
            // Profile View
            ProfileView()
                .tabItem {
                    Label("Profile", systemImage: "person.fill")
                }
        }
    }
}
                
// TODO: Uncomment for logout button.
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            Button("Log out") {
//                                print("Successfully logged out")
//                                authService.regularSignOut { error in
//                                    
//                                    if let e = error {
//                                        print(e.localizedDescription)
//                                    }
//                                }
//                            }
//                        }
//                    }


#Preview {
    ContentView()
}
