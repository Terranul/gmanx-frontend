//
//  UserService.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-27.
//

import Foundation

enum UserError: Error {
    case RegistrationError(String)
}

class UserService {
    
    func registerUser() async throws {
        let userInfo = UserInfo.shared
        if let gmail = await userInfo.gmail, let gmailAuthToken = await userInfo.gmailAuthToken, let refreshToken = await userInfo.refreshToken {
            var request = await getBackendRequest(path: "register")
            let body = ["authToken": gmailAuthToken, "refreshToken": refreshToken, "gmail": gmail]
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
            let (data, response) = try await URLSession.shared.data(for: request)
            print(String(data: data, encoding: .utf8)!)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw UserError.RegistrationError("Not an http response")
            }
            if (httpResponse.statusCode != 202) {
                throw UserError.RegistrationError("Please try to sign in again")
            }
        } else {
            debugPrint("not all user info has been completed")
        }
    }
}
