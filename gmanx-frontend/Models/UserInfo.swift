//
//  UserInfo.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-28.
//

actor UserInfo {
    
    var gmail: String? = nil
    var gmailAuthToken: String? = nil
    var refreshToken: String? = nil
    
    static var shared = UserInfo()
    
    func setGmail(_ gmail: String) {
        print("set gmail: " + gmail)
        self.gmail = gmail
    }
    
    func setAuthToken(_ gmailAuthToken: String) {
        print("set auth Token:" + gmailAuthToken)
        self.gmailAuthToken = gmailAuthToken
    }
    
    func setRefreshToken(_ refreshToken: String) {
        print("set refreshToken: " + refreshToken)
        self.refreshToken = refreshToken
    }
    
}
