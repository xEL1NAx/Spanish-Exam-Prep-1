import Foundation

// Several multiple-choice sets and free-text questions; also helper to generate random quizzes.
let reflexiveQuestionsSetA: [Question] = [
    Question(prompt: "Ich stehe auf.", answer: "Me levanto", choices: nil, type: .freeText),
    Question(prompt: "Ich dusche mich.", answer: "Me ducho", choices: nil, type: .freeText),
    Question(prompt: "Wähle die richtige Übersetzung: 'Me ducho'", answer: "Ich dusche mich", choices: ["Ich rasiere mich", "Ich kämme mich", "Ich ducho", "Ich dusche mich"], type: .multipleChoice),
    Question(prompt: "Ich ziehe mich an.", answer: "Me visto", choices: nil, type: .freeText)
]

let reflexiveQuestionsSetB: [Question] = [
    Question(prompt: "Ich gehe schlafen.", answer: "Me acuesto", choices: nil, type: .freeText),
    Question(prompt: "Wähle die richtige Übersetzung: 'Me relajo'", answer: "Ich entspanne mich", choices: ["Ich ärgere mich", "Ich entspanne mich", "Ich wasche mich", "Ich kämme mich"], type: .multipleChoice),
    Question(prompt: "Ich rasiere mich.", answer: "Me afeito", choices: nil, type: .freeText),
    Question(prompt: "Wähle: 'Me llamo' bedeutet...", answer: "Ich heiße", choices: ["Ich wasche mich","Ich heiße","Ich bleibe","Ich ziehe mich an"], type: .multipleChoice)
]

let reflexiveQuestionsSetC: [Question] = [
    Question(prompt: "Ich fühle mich gut.", answer: "Me siento bien", choices: nil, type: .freeText),
    Question(prompt: "Wähle die richtige Übersetzung: 'Me pongo la chaqueta'", answer: "Ich ziehe die Jacke an", choices: ["Ich setze mich","Ich ziehe die Jacke an","Ich dusche mich","Ich vergesse"], type: .multipleChoice),
    Question(prompt: "Ich vergesse etwas.", answer: "Me olvido de algo", choices: nil, type: .freeText),
    Question(prompt: "Wähle: 'Me divierto' ->", answer: "Ich habe Spaß", choices: ["Ich habe Spaß","Ich bin müde","Ich bin traurig","Ich bin still"], type: .multipleChoice)
]

// Helper: combine sets and shuffle for a random quiz
func makeRandomQuiz(numberOfQuestions: Int = 6) -> [Question] {
    let combined = (reflexiveQuestionsSetA + reflexiveQuestionsSetB + reflexiveQuestionsSetC)
    let shuffled = combined.shuffled()
    return Array(shuffled.prefix(min(numberOfQuestions, shuffled.count)))
}
