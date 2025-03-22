//
//  QuizModel.swift
//  Assignment_3
//
//  Created by Yatin Parulkar on 2025-03-21.
//

import Foundation

struct Quiz {
    let questions: [Questions]
    var currentQuestionIndex = 0
    var userAnswers: [Int?]
    var score = 0

    init(questions: [Questions]) {
        self.questions = questions
        self.userAnswers = Array(repeating: nil, count: questions.count)
    }

    mutating func submitAnswer(answerIndex: Int) {
        userAnswers[currentQuestionIndex] = answerIndex
        if answerIndex == questions[currentQuestionIndex].correctAnswerIndex {
            score += 1
        }
    }

    func calculateAverage() -> Double {
        guard !questions.isEmpty else {
            return 0.0
        }
        return Double(score) / Double(questions.count) * 100.0
    }
}
