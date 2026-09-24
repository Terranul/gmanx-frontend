//
//  LandingPage.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-02.
//

import SwiftUI

struct LandingPage: View {
    
    var body: some View {
        TabView {
            EmailPage()
                .tabItem {
                    Text("Pending Emails")
                }
        }
    }
}
