//
//  Email.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-02.
//

struct Email: Decodable {
    let body: String
    let to: String
    let from: String
    let subject: String
}
