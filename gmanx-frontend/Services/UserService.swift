//
//  UserService.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-27.
//

import Foundation

class UserService {
    
    func registerUser() async throws {
        let userInfo = UserInfo.shared
        if let gmail = await userInfo.gmail, let notificationId = await userInfo.notificationId, let gmailAuthToken = await userInfo.gmailAuthToken, let refreshToken = await userInfo.refreshToken {
            var request = await getBackendRequest(path: "register")
            let body = ["authToken": gmailAuthToken, "refreshToken": refreshToken, "notificationId": notificationId, gmail: "gmail"]
            request.httpBody = try JSONSerialization.data(withJSONObject: body)
            let response = try await URLSession.shared.data(for: request)
        } else {
            debugPrint("not all user info has been completed")
        }
    }
}
