import SwiftUI

struct ReflexiveQuizView: View {
    @State private var currentIndex: Int = 0
    @State private var inputText: String = ""
    @State private var score: Int = 0
    @State private var showResult: Bool = false
    @State private var selectedChoice: String?
    @State private var showAlert: Bool = false
    @AppStorage("totalScore") private var totalScore: Int = 0
    @AppStorage("totalAttempts") private var totalAttempts: Int = 0

    let questions: [Question]

    var body: some View {
        VStack(spacing: 20) {
            if currentIndex < questions.count {
                let q = questions[currentIndex]
                Text("Frage \(currentIndex + 1) von \(questions.count)")
                    .font(.headline)

                Text(q.prompt)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .padding()

                if q.type == .freeText {
                    TextField("Antwort auf Spanisch", text: $inputText)
                        .textFieldStyle(.roundedBorder)
#if os(iOS)
                        .autocorrectionDisabled(true)
                        .textInputAutocapitalization(TextInputAutocapitalization.never)
#endif
                        .padding(.horizontal)
                    Button("Antwort prüfen") {
                        checkFreeText(q: q)
                    }
                    .buttonStyle(.borderedProminent)
                    .padding(.top, 8)
                } else {
                    // Multiple choice UI
                    let choices = q.choices ?? []
                    VStack(spacing: 10) {
                        ForEach(choices, id: \.self) { c in
                            Button {
                                selectedChoice = c
                            } label: {
                                HStack {
                                    Text(c)
                                        .foregroundColor(.primary)
                                    Spacer()
                                    if selectedChoice == c {
                                        Image(systemName: "checkmark.circle.fill")
                                            .foregroundStyle(Color.accentColor)
                                    }
                                }
                                .padding()
                                .background(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(selectedChoice == c ? Color.accentColor : Color.gray, lineWidth: 1)
                                )
                            }
                        }

                        Button("Antwort prüfen") {
                            guard let choice = selectedChoice else {
                                showAlert = true
                                return
                            }
                            if normalize(choice) == normalize(q.answer) {
                                score += 1
                            }
                            nextQuestion()
                        }
                        .buttonStyle(.borderedProminent)
                        .padding(.top, 8)
                    }
                    .padding(.horizontal)
                }

                Spacer()
            } else {
                VStack(spacing: 12) {
                    Text("Fertig!")
                        .font(.largeTitle)
                    Text("Dein Ergebnis: \(score) / \(questions.count)")
                        .font(.title2)
                    Button("Nochmal versuchen") {
                        restart()
                    }
                    .buttonStyle(.borderedProminent)
                }
                Spacer()
            }
        }
        .padding()
        .navigationTitle("Reflexivverben - Quiz")
        .alert("Bitte wähle eine Option", isPresented: $showAlert) {
            Button("OK", role: .cancel) {}
        }
        .onDisappear {
            // update global progress
            totalScore += score
            totalAttempts += questions.count
        }
    }

    private func checkFreeText(q: Question) {
        if normalize(inputText) == normalize(q.answer) {
            score += 1
        }
        inputText = ""
        nextQuestion()
    }

    private func nextQuestion() {
        currentIndex += 1
        selectedChoice = nil
    }

    private func restart() {
        currentIndex = 0
        score = 0
    }

    private func normalize(_ s: String) -> String {
        s.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

