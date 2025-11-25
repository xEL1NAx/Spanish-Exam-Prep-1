import Foundation

struct Verb: Identifiable, Codable, Equatable {
    let id: UUID
    let spanish: String
    let german: String
    let example: String

    init(id: UUID = UUID(), spanish: String, german: String, example: String) {
        self.id = id
        self.spanish = spanish
        self.german = german
        self.example = example
    }
}
