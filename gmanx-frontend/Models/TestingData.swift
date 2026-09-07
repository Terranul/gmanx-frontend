//
//  TestingData.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-06.
//

let responses = EmailResponses(drafts: [
    EmailPair(
        stage: .new,
        draftId: "draft-1",
        email: EmailReceipt(
            emailId: "email-1",
            body: Email(
                body: "Hey, just wanted to follow up about the project.",
                to: "alex@example.com",
                from: "me@example.com",
                subject: "Project follow-up"
            )
        )
    ),
    EmailPair(
        stage: .new,
        draftId: "draft-2",
        email: EmailReceipt(
            emailId: "email-2",
            body: Email(
                body: "Would you be available to meet next week?",
                to: "sam@example.com",
                from: "me@example.com",
                subject: "Meeting next week"
            )
        )
    ),
    EmailPair(
        stage: .new,
        draftId: "draft-3",
        email: EmailReceipt(
            emailId: "email-3",
            body: Email(
                body: "Thanks for sending that over.",
                to: "jordan@example.com",
                from: "me@example.com",
                subject: "Re: Documents"
            )
        )
    ),
    EmailPair(
        stage: .ongoing(1),
        draftId: "draft-4",
        email: EmailReceipt(
            emailId: "email-4",
            body: Email(
                body: "I wanted to get back to you regarding the position.",
                to: "company@example.com",
                from: "me@example.com",
                subject: "Re: Application"
            )
        )
    ),
    EmailPair(
        stage: .ongoing(2),
        draftId: "draft-5",
        email: EmailReceipt(
            emailId: "email-5",
            body: Email(
                body: "I've attached the updated version for you to review.",
                to: "team@example.com",
                from: "me@example.com",
                subject: "Updated draft"
            )
        )
    ),
    EmailPair(
        stage: .ongoing(3),
        draftId: "draft-6",
        email: EmailReceipt(
            emailId: "email-6",
            body: Email(
                body: "Let me know if you have any questions.",
                to: "professor@example.com",
                from: "me@example.com",
                subject: "Project update"
            )
        )
    )
])
