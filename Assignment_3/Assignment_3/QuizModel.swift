//
//  QuizModel.swift
//  Assignment_3
//
//  Created by Yatin Parulkar on 2025-03-21.
//

import Foundation



class Quiz {
    
    static var shared : Quiz = Quiz()
    var delagate : QuestionBankDelegate?
    
    var questions: [Questions] = []
    var currentQuestionIndex = 0
    var userAnswers: [String] = []
    var score = 0

   
    func calculateAverage() -> Double {
        guard !questions.isEmpty else {
            return 0.0
        }
        return Double(score) / Double(questions.count) * 100.0
    }
    
    func add(newQuiz : Questions) {
        print("inAdd", newQuiz)
        self.questions.append(newQuiz)
        print(questions)
        delagate?.didAddQuestion()
    }
}
