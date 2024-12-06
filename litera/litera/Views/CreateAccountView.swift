//
//  CreateAccountView.swift
//  litera
//
//  Created by Angelina Chen on 12/6/24.
//

import SwiftUI

struct CreateAccountView: View {
    @StateObject var authService = AuthService()
    
    var body: some View {
        VStack {
            NavigationLink(destination: RegistrationView().environmentObject(authService)) {
                Text("Create Account").foregroundColor(.blue)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
