//
//  AppDelegate.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-28.
//

import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {

}

extension AppDelegate {
    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) async {
        await UserInfo.shared.setNotificationId(deviceToken.base64EncodedString())
        do {
            try await UserService().registerUser()
        } catch(let err) {
            debugPrint(err)
            debugPrint("Could not complete registration request")
        }
    }
}


