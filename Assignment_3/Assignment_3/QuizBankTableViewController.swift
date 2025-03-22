//
//  QuizBankTableViewController.swift
//  Assignment_3
//
//  Created by Yatin Parulkar on 2025-03-21.
//

import UIKit

class QuestionBankTableViewController: UITableViewController {

    // MARK: - Properties
    var questions: [Questions] = []
    weak var delegate: QuestionBankDelegate?  // Use the protocol

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        setupTitle()
        setupTableView()
        setupAddButton()
    }

    private func setupTitle() {
        title = "Question Bank"
    }

    private func setupTableView() {
        // Set up the table view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func setupAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addQuestionTapped))
        navigationItem.rightBarButtonItem = addButton
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let question = questions[indexPath.row]
        cell.textLabel?.text = question.text
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "Correct: \(question.answers[question.correctAnswerIndex])\nIncorrect: \(getIncorrectAnswers(from: question).joined(separator: ", "))"
        return cell
    }
    
    private func getIncorrectAnswers(from question: Questions) -> [String] {
        var incorrectAnswers = [String]()
        for (index, answer) in question.answers.enumerated() {
            if index != question.correctAnswerIndex {
                incorrectAnswers.append(answer)
            }
        }
        return incorrectAnswers
    }

    // MARK: - Table View Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionToEdit = questions[indexPath.row]
        let questionBuilderVC = QuestionBuilderViewController()
        questionBuilderVC.questionToEdit = questionToEdit
        questionBuilderVC.delegate = delegate
        // Use present instead of push.
        present(questionBuilderVC, animated: true, completion: nil)
    }

    // MARK: - Button Actions
    @objc func addQuestionTapped() {
        let questionBuilderVC = QuestionBuilderViewController()
        questionBuilderVC.delegate = delegate
       
    }

    // MARK: - Data Handling
    func didAddQuestion(_ question: Questions) {
        questions.append(question)
        delegate?.didAddQuestion(question)
        tableView.reloadData()
    }

    func didUpdateQuestion(_ question: Questions) {
        if let index = questions.firstIndex(where: { $0.text == question.text }) {
            questions[index] = question
            delegate?.didUpdateQuestion(question)
            tableView.reloadData()
        }
    }
}
