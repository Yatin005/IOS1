import UIKit
class QuestionBankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: - Properties
    var questions: [Question] = []
    weak var delegate: MainViewController?
    @IBOutlet weak var tableView: UITableView! // Connect to the UITableView in Storyboard

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
        //  Set up the table view using the IBOutlet
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }

    private func setupAddButton() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addQuestionTapped))
        navigationItem.rightBarButtonItem = addButton
    }

    // MARK: - Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return questions.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let question = questions[indexPath.row]
        cell.textLabel?.text = question.text
        cell.detailTextLabel?.numberOfLines = 0
        cell.detailTextLabel?.text = "Correct: \(question.answers[question.correctAnswerIndex])\nIncorrect: \(getIncorrectAnswers(from: question).joined(separator: ", "))"
        return cell
    }

    private func getIncorrectAnswers(from question: Question) -> [String] {
        var incorrectAnswers = [String]()
        for (index, answer) in question.answers.enumerated() {
            if index != question.correctAnswerIndex {
                incorrectAnswers.append(answer)
            }
        }
        return incorrectAnswers
    }

    // MARK: - Table View Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let questionToEdit = questions[indexPath.row]
        let questionBuilderVC = QuestionBuilderViewController()
        questionBuilderVC.questionToEdit = questionToEdit
        questionBuilderVC.delegate = delegate
        navigationController?.pushViewController(questionBuilderVC, animated: true)
    }

    // MARK: - Button Actions
    @objc func addQuestionTapped() {
        let questionBuilderVC = QuestionBuilderViewController()
        questionBuilderVC.delegate = delegate
        navigationController?.pushViewController(questionBuilderVC, animated: true)
    }

    // MARK: - Data Handling
    func didAddQuestion(_ question: Question) {
        questions.append(question)
        delegate?.didAddQuestion(question)
        tableView.reloadData()
    }

    func didUpdateQuestion(_ question: Question) {
        if let index = questions.firstIndex(where: { $0.text == question.text }) {
            questions[index] = question
            delegate?.didUpdateQuestion(question)
            tableView.reloadData()
        }
    }
}
