//
//  RegistrationView.swift
//  litera
//
//  Created by Angelina Chen on 12/4/24.
//

import SwiftUI


struct RegistrationView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToContentView = false
    @EnvironmentObject var authService: AuthService

    var body: some View {
        NavigationView {
            ZStack {
                Color.lightBeige
                    .ignoresSafeArea()
                    .opacity(0.5)
                
                VStack {
                    TextField("Email", text: $email)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 10)
                    SecureField("Password", text: $password)
                        .textFieldStyle(.roundedBorder)
                        .padding(.horizontal, 10)
                    
                    Button("Create an Account") {
                        authService.regularCreateAccount(email: email, password: password)
                        navigateToContentView = true
                    }
                    .controlSize(.large)
                    .background(Color.lightBlue)
                    .cornerRadius(20)
                    .padding(.top, 30)
                    .buttonStyle(.borderedProminent)

                    
                    NavigationLink (
                        destination: ContentView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $navigateToContentView
                    ) {
                        EmptyView()
                    }
                    
                    HStack {
                        Text("Already have an account? ")
                            .foregroundStyle(Color.gray)
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Login").foregroundColor(.blue)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 10)
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
