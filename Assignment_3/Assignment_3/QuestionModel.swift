//
//  QuestionModel.swift
//  Assignment_3
//
//  Created by Yatin Parulkar on 2025-03-21.
//

import Foundation

struct Questions {
    let id: UUID
    let text: String
    let answers: String
    let incorrect: [String]
    
    init(id: UUID, text: String, answers: String, incorrect: [String]) {
        self.id = id
        self.text = text
        self.answers = answers
        self.incorrect = incorrect
    }
}
