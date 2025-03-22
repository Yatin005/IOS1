//
//  QuizBuilderViewController.swift
//  Assignment_3
//
//  Created by Yatin Parulkar on 2025-03-21.
//

import UIKit

class QuestionBuilderViewController: UIViewController {
    
    weak var delegate: QuestionBankDelegate?
    var questionToEdit: Questions?
    
    // MARK: - IBOutlets
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var correctAnswerTextField: UITextField!
    @IBOutlet weak var incorrect1TextField: UITextField!
    @IBOutlet weak var incorrect2TextField: UITextField!
    @IBOutlet weak var incorrect3TextField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        setupTitle()
        setupTextFields()
        setupDoneButton()
    }
    
    private func setupTitle() {
        title = (questionToEdit != nil) ? "Edit Question" : "Add New Question"
    }
    
    private func setupTextFields() {
        // Populate text fields if editing a question
        if let question = questionToEdit {
            questionTextField.text = question.text
            correctAnswerTextField.text = question.answers[question.correctAnswerIndex]
            let incorrectAnswers = getIncorrectAnswers(from: question)
            incorrect1TextField.text = incorrectAnswers.count > 0 ? incorrectAnswers[0] : ""
            incorrect2TextField.text = incorrectAnswers.count > 1 ? incorrectAnswers[1] : ""
            incorrect3TextField.text = incorrectAnswers.count > 2 ? incorrectAnswers[2] : ""
        }
    }
    
    private func getIncorrectAnswers(from question: Questions) -> [String] {
        var incorrectAnswers = [String]()
        for (index, answer) in question.answers.enumerated() {
            if index != question.correctAnswerIndex {
                incorrectAnswers.append(answer)
            }
            
        }
        
        
    }


    private func setupDoneButton() {
        doneButton.setTitle((questionToEdit != nil) ? "Save" : "Done", for: .normal)
    }

    // MARK: - IBActions
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func doneButtonTapped(_ sender: UIButton) {
        guard let questionText = questionTextField.text, !questionText.isEmpty,
              let correctAnswer = correctAnswerTextField.text, !correctAnswer.isEmpty,
              let incorrect1 = incorrect1TextField.text, !incorrect1.isEmpty,
              let incorrect2 = incorrect2TextField.text, !incorrect2.isEmpty,
              let incorrect3 = incorrect3TextField.text, !incorrect3.isEmpty else {
            showAlert(title: "Missing Information", message: "Please fill in all fields.")
            return
        }

        let answers = [correctAnswer, incorrect1, incorrect2, incorrect3]
        // Ensure correct answer is at index 0
        let updatedQuestion = Questions(text: questionText, answers: answers, correctAnswerIndex: 0)

        if questionToEdit != nil {
            delegate?.didUpdateQuestion(updatedQuestion)
        } else {
            delegate?.didAddQuestion(updatedQuestion)
        }
        dismiss(animated: true, completion: nil)
    }

  
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
