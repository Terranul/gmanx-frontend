//
//  GlobalCode.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-08-28.
//

import Foundation

func getBackendRequest(path: String) async -> URLRequest{
    var request = URLRequest(url: URL(string: "https://emanx-backend.onrender.com/v1/\(path)")!)
    request.httpMethod = "POST"
    request.setValue(await UserInfo.shared.gmail, forHTTPHeaderField: "gmail")
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    // ok
    request.setValue("12rwahn6cSahj7klpIu", forHTTPHeaderField: "api_key")
    return request
}
