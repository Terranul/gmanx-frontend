//
//  DraftViewModel.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-07.
//

import Observation
import Foundation

@Observable
class DraftViewModel {
    
    // representing the draft from the previous stage. Nil if no stage before exists
    var prevDraft: Email
    var didFail: Bool = false
    
    init() {
        self.prevDraft = Email()
    }
    
    init(draftId: String?) async {
        guard let draftId else {
            self.prevDraft = Email()
            return
        }
        self.prevDraft = Email()
        await self.populate(draftId: draftId)
    }
    
    func populate(draftId: String) async {
        do {
            let userCode = ""
            var request = getBackendRequest(path: "users/\(userCode)/drafts/\(draftId)")
            request.httpMethod = "GET"
            let (data, http) = try await URLSession.shared.data(for: request)
            self.prevDraft = try JSONDecoder().decode(Email.self, from: data)
        } catch {
            self.prevDraft = Email()
            self.didFail = true
        }
    }
    
    // updates the email at draftId to the self.prevDraft
    func updateDraft(draftId: String) async throws -> String {
        let userCode = ""
        var request = getBackendRequest(path: "users/\(userCode)/drafts/\(draftId)")
        request.httpMethod = "PATCH"
        let (data, http) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Dictionary<String, String>.self, from: data)["emailCode"]!
    }
    
    // to be used at the discretion of the View (call when stage is early)
    func createDraft() async throws -> String {
        let userCode = ""
        var request = getBackendRequest(path: "users/\(userCode)/drafts")
        request.httpMethod = "PUT"
        let (data, http) = try await URLSession.shared.data(for: request)
        return try JSONDecoder().decode(Dictionary<String, String>.self, from: data)["emailCode"]!
    }
}
