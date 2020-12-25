//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Sumithra Candasamy on 12/25/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let questionText: String
    let answer: String
    
    init(q: String, a: String) {
        self.questionText = q
        self.answer = a
    }
}
