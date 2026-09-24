//
//  UserViewModel.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-27.
//
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift
import Foundation
import Observation

@Observable
class UserViewModel {
    
    var didRegister: Bool = false
    var userService: UserService = UserService()
    var registrationError: String? = nil
    
    func googleSignIn() async {
        do {
            // try to restore the sign in first
            let result = try await userService.getSignInResult()
            let user = UserInfo(authToken: result.accessToken.tokenString, refreshToken: result.refreshToken.tokenString)
            print("email:" + result.profile!.email)
            print("access token " + user.authToken)
            print("refresh token " + user.refreshToken)
            // should be fine since never calling from the main thread
            try await userService.registerUser(user: user, gmail: result.profile!.email)
            print("will run did register")
            self.didRegister = true
        } catch UserError.RegistrationError(let message) {
            print("threw and errror: " + message)
            registrationError = message
        } catch {
            fatalError("This was not supposed to happen (UserViewModel:35)")
        }
    }
    
    
    

}
