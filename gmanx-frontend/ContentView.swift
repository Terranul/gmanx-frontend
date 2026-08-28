//
//  ContentView.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-21.
//

import GoogleSignIn
import GoogleSignInSwift
import SwiftUI


struct ContentView: View {
    
    let userViewModel = UserViewModel()
    
    var body: some View {
        VStack {
            GoogleSignInButton {
                Task {
                    await userViewModel.googleSignIn()
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
