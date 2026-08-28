//
//  UserViewModel.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-27.
//
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift


class UserViewModel {
    
    var didRegister: Bool = false
    
    func googleSignIn() async {
        guard let rootViewController = UIApplication.shared.rootViewController else {
            // Handle error
            return
        }
        do {
            let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint: nil, additionalScopes: ["https://mail.google.com/"])
            // should be fine since never calling from the main thread
            await UserInfo.shared.setAuthToken(result.user.accessToken.tokenString)
            await UserInfo.shared.setGmail(result.user.userID!)
            await UserInfo.shared.setRefreshToken(result.user.refreshToken.tokenString)
            UIApplication.shared.registerForRemoteNotifications()
        } catch {
            debugPrint("error with google sign in")
        }
    }
    
    
    
    

}
