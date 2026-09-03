//
//  EmailViewModel.swift
//  gmanx-frontend
//
//  Created by Ben Faraone on 2026-09-02.
//

import SwiftUI
import Observation

enum EmailStatus {
    case ongoing
    case new
    case custom(Int)
}


@Observable
class EmailViewModel {
    
    var emails: [EmailResponse] = []
   
}
