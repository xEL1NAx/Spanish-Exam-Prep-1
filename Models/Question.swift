import Foundation

enum QuestionType: String, Codable {
    case freeText
    case multipleChoice
}

struct Question: Identifiable, Codable, Equatable {
    let id: UUID
    let prompt: String        // e.g. "Ich stehe auf."
    let answer: String        // correct answer e.g. "Me levanto"
    let choices: [String]?    // optional choices for multiple choice
    let type: QuestionType

    init(id: UUID = UUID(), prompt: String, answer: String, choices: [String]? = nil, type: QuestionType) {
        self.id = id
        self.prompt = prompt
        self.answer = answer
        self.choices = choices
        self.type = type
    }
}
