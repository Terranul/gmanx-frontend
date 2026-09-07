//
//  EmailPage.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-02.
//

import SwiftUI

struct EmailPage: View {
    
    @State var emailViewModel = EmailViewModel()
    
    
    
    var body: some View {
        VStack {
            Text("My Emails")
            Text("New Emails")
            ForEach(emailViewModel.getEmailByStatus(.new), id: \.self) { email in
                EmailCardView(pair: email)
            }
            Text("Ongoing Emails")
            ForEach(emailViewModel.getEmailByStatus(.ongoing(-1)), id: \.self) { email in
                EmailCardView(pair: email)
            }
            
        }
    }
}

struct EmailCardView: View {
    
    let pair: EmailPair
    
    var body: some View {
        HStack {
            switch(pair.stage) {
            case .new:
                Circle()
                    .fill(.green)
            case .ongoing:
                Circle()
                    .fill(.orange)
            default:
                Circle()
                    .fill(.gray)
            }
            VStack(alignment: .leading) {
                Text(pair.email.body.subject)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text(pair.email.body.from)
                    .fontWeight(.light)
                    .font(.system(size: 10))
            }
        }
    }
}
