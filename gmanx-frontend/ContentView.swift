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
    
    let googleAuthScopes: [String] = ["https://mail.google.com/"]
    
    var body: some View {
        VStack {
            GoogleSignInButton {
                Task {
                    await googleSignIn()
                }
            }
        }
        .padding()
    }
    
    func googleSignIn() async {
        guard let rootViewController = UIApplication.shared.rootViewController else {
            // Handle error
            return
        }
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint: nil, additionalScopes: googleAuthScopes)
            print("access Token:" + result.user.accessToken.tokenString)
            print("credentials:" + (result.user.grantedScopes?.first ?? ""))
        } catch {
            print("ah shit")
        }
    }
}

#Preview {
    ContentView()
}
