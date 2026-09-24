//
//  DraftEdit.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-07.
//

import SwiftUI

struct DraftEdit: View {
    
    var draftViewModel: DraftViewModel
    let pair: EmailPair
    
    init(pair: EmailPair) {
        self.pair = pair
        self.draftViewModel = DraftViewModel()
    }
    
    var body: some View {
        
        VStack {
            HStack {
                Text("From")
                TextField("Text", text: .constant(pair.email.body.from))
                    .disabled(true)
                
            }
            HStack {
                Text("Subject")
                TextField("Text", text: .constant(pair.email.body.subject))
                    .disabled(true)
                
            }
            HStack {
                Text("Body")
                TextField("Text", text: .constant(pair.email.body.body))
                    .disabled(true)
            }
            HStack {
                Text("Body")
                //TextField("Text", text: draftViewModel.prevDraft.body)
                    .disabled(true)
                    .cornerRadius(485)
            }
            
        }
        .task {
            do {
                await self.draftViewModel.populate(draftId: pair.draftId!)
            } catch {
                
            }
        }
    }
}
