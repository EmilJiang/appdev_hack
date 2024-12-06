//
//  GetStartedView.swift
//  litera
//
//  Created by Angelina Chen on 12/6/24.
//

import SwiftUI

struct GetStartedView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image("bigredbooks_logo")
                    .resizable()
                    .padding()
            
                NavigationLink(destination: CreateAccountView()) {
                    Text("Get Started")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, minHeight: 50)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
        }
    }
}
