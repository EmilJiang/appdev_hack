//
//  LoginView.swift
//  litera
//
//  Created by Angelina Chen on 12/4/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToContentView = false
    @EnvironmentObject var authService: AuthService
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
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
                    
                    Button("Login") {
                        authService.regularSignIn(email: email, password: password) { error in
                            if let e = error {
                                print(e.localizedDescription)
                            } else {
                                // Set navigateToContentView to true after successful login
                                navigateToContentView = true
                            }
                        }
                    }
                    .controlSize(.large)
                    .background(Color.lightBlue)
                    .cornerRadius(20)
                    .padding(.top, 30)
                    .buttonStyle(.borderedProminent)
                    
                    HStack {
                        Text("Don't have an account? ")
                            .foregroundStyle(Color.gray)
                        
                        NavigationLink(destination: RegistrationView()) {
                            Text("Create Account").foregroundColor(.blue)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.top, 2)

                    .navigationDestination(isPresented: $navigateToContentView) {
                        ContentView()
                    }
                }
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

