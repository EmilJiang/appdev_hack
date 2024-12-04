//
//  StartView.swift
//  litera
//
//  Created by Angelina Chen on 12/4/24.
//

import SwiftUI
import FirebaseAuth

struct StartView: View {
    @EnvironmentObject var authService: AuthService
    
    var body: some View {
        if authService.signedIn {
            ContentView()
        } else {
            RegistrationView()
        }
    }
}

struct StartView_Previews: PreviewProvider {
    @StateObject static var authService = AuthService()

    static var previews: some View {
        if authService.signedIn {
            ContentView()
        } else {
            RegistrationView()
        }
    }
}
