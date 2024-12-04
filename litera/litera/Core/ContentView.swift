//
//  ContentView.swift
//  litera
//
//  Created by Angelina Chen on 12/2/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authService: AuthService
        
        var body: some View {
            NavigationStack {
                Text("Home Screen")
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button("Log out") {
                                print("Successfully logged out")
                                authService.regularSignOut { error in
                                    
                                    if let e = error {
                                        print(e.localizedDescription)
                                    }
                                }
                            }
                        }
                    }
            }
        }
}

#Preview {
    ContentView()
}
