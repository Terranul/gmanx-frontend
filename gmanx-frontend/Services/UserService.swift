//
//  UserService.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-27.
//

import Foundation
import SwiftUI
import GoogleSignIn
import GoogleSignInSwift

enum UserError: Error {
    case RegistrationError(String)
}

class UserService {
    
    func registerUser(user: UserInfo, gmail: String) async throws {
        var request = await getBackendRequest(path: "users/emails/\(gmail)")
        request.httpMethod = "PUT"
        let body = try JSONEncoder().encode(user)
        request.httpBody = body
        let (data, response) = try await URLSession.shared.data(for: request)
        print(String(data: data, encoding: .utf8)!)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw UserError.RegistrationError("Not an http response")
        }
//        if (httpResponse.statusCode != 200) {
//            throw UserError.RegistrationError("Please try to sign in again")
//        }
    }
    
    func getSignInResult() async throws -> GIDGoogleUser {
        guard let rootViewController = UIApplication.shared.rootViewController else {
            // Handle error
            fatalError("Could not find the root view")
        }
        do {
            // attempt to restore previous sign in
            return try await GIDSignIn.sharedInstance.restorePreviousSignIn()
        } catch {
            return try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController, hint: nil, additionalScopes: ["https://mail.google.com/"]).user
        }
    }
}
