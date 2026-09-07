//
//  EmailViewModel.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-02.
//

import SwiftUI
import Observation


@Observable
class EmailViewModel {
    
    var emails: [EmailPair] = []
    
    init() {
        self.emails = responses.drafts
    }
    
    private var sortedEmails: Dictionary<Status, [EmailPair]> {
        var result = Dictionary<Status, [EmailPair]>()
        for pair in self.emails {
            if var cur: [EmailPair] = result[pair.stage] {
                cur.append(pair)
                result[pair.stage] = cur
            } else {
                result[pair.stage] = [pair]
            }
        }
        return result
    }
    
    func getEmailByStatus(_ status: Status) -> [EmailPair] {
        return self.sortedEmails[status] ?? []
    }
   
}
