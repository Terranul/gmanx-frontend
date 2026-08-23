//
//  gmanx_frontendApp.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-21.
//

import GoogleSignInSwift

extension UIApplication {
  // Minimal implementation to retrieve the active root view
  // controller for presentation. Apps presenting sign-in from deeper
  // within an existing view hierarchy should ensure they select the
  // appropriate view controller.
  var rootViewController: UIViewController? {
    let windowScene = connectedScenes
      .compactMap { scene in scene as? UIWindowScene }
      .first { scene in scene.activationState == .foregroundActive }
    return windowScene?.windows.first(where: { window in window.isKeyWindow })?.rootViewController
  }
}

import GoogleSignIn
import SwiftUI

@main
struct gmanx_frontendApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                    
                }
        }
    }
}
