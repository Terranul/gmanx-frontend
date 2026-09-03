//
//  ContentView.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-21.
//

import GoogleSignIn
import GoogleSignInSwift
import SwiftUI
import Observation


struct ContentView: View {
    
    
    @State var userViewModel = UserViewModel()
    
    var body: some View {
        NavigationStack {
            if (userViewModel.didRegister) {
                LandingPage()
            } else {
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
    }
}

#Preview {
    ContentView()
}
