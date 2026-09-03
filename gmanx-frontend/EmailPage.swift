//
//  EmailPage.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-02.
//

import SwiftUI

struct EmailPage: View {
    
    
    
    var body: some View {
        VStack {
            Text("My Emails")
            
        }
    }
}

struct EmailCardView: View {
    
    let emailResponse: EmailResponse
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(emailResponse.email.subject)
                    .fontWeight(.bold)
                    .font(.system(size: 20))
                Text(emailResponse.email.from)
                    .fontWeight(.light)
                    .font(.system(size: 10))
            }
            switch(emailResponse.status) {
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
        }
    }
}
