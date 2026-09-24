//
//  Email.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-02.
//

enum Status: Hashable {
    case new
    case ongoing(Int)
    case complete
    
    static func == (lhs: Status, rhs: Status) -> Bool {
        return lhs.hashValue == rhs.hashValue
    }
    
    func hash(into hasher: inout Hasher) {
        switch(self) {
        case .new:
            hasher.combine(1)
        case .ongoing(_):
            hasher.combine(2)
        case .complete:
            hasher.combine(3)
        }
    }

    init(stage: Int) {
        // TODO add .complete case
        if (stage <= 0) {
            self = .new
        } else {
            self = .ongoing(stage)
        }
    }
}

struct EmailResponses: Decodable {
    let drafts: [EmailPair]
}

struct EmailPair: Decodable, Hashable {
    
    enum CodingKeys: CodingKey {
        case stage
        case draftId
        case email
    }
    
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let stage: Int = try container.decode(Int.self, forKey: .stage)
        self.stage = Status(stage: stage)
        self.draftId = try container.decode(String.self, forKey: .draftId)
        self.email = try container.decode(EmailReceipt.self, forKey: .email)
    }
    
    init(stage: Status, draftId: String, email: EmailReceipt) {
        self.stage = stage
        self.draftId = draftId
        self.email = email
    }
    
    let stage: Status
    let draftId: String?
    let email: EmailReceipt
}

struct EmailReceipt: Decodable, Hashable {
    
    let emailId: String
    let body: Email
}

struct Email: Decodable, Hashable {
    
    init() {
        self.body = ""
        self.to = ""
        self.from = ""
        self.subject = ""
    }
    
    init(body: String, to: String, from: String, subject: String) {
        self.body = body
        self.to = to
        self.from = from
        self.subject = subject
    }
    
    let body: String
    let to: String
    let from: String
    let subject: String
}
