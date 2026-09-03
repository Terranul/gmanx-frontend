//
//  EmailResponse.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-02.
//
import SwiftData

struct EmailResponse {
    
    var responseCode: String
    var status: EmailStatus
    var email: Email
}
