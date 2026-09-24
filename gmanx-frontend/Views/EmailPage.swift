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
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text("My Emails")
                Text("New Emails")
                ForEach(emailViewModel.getEmailByStatus(.new), id: \.self) { email in
                    EmailCardView(pair: email)
                }
                Text("Ongoing Emails")
                ForEach(emailViewModel.getEmailByStatus(.ongoing(1)), id: \.self) { email in
                    EmailCardView(pair: email)
                }
                
            }
        }
    }
}

struct EmailCardView: View {
    
    let pair: EmailPair
    
    var body: some View {
        HStack {
            switch pair.stage {
            case .new:
                Circle()
                    .fill(.green)
                    .frame(width: 10, height: 10)

            case .ongoing:
                Circle()
                    .fill(.orange)
                    .frame(width: 10, height: 10)

            default:
                Circle()
                    .fill(.gray)
                    .frame(width: 10, height: 10)
            }

            VStack(alignment: .leading) {
                Text(pair.email.body.subject)
                    .fontWeight(.bold)
                    .font(.system(size: 25))

                Text(pair.email.body.from)
                    .fontWeight(.light)
                    .font(.system(size: 20))
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(.gray)
        }
    }
}
