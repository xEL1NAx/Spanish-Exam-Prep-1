import SwiftUI

struct ContentView: View {
    @AppStorage("totalScore") private var totalScore: Int = 0
    @AppStorage("totalAttempts") private var totalAttempts: Int = 0

    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Üben")) {
                    NavigationLink {
                        FlashcardDeckView(verbs: allReflexiveVerbs)
                    } label: {
                        Label("📚 Vokabeltrainer (Reflexivverben)", systemImage: "book")
                    }

                    NavigationLink {
                        ReflexiveQuizView(questions: makeRandomQuiz(numberOfQuestions: 8))
                    } label: {
                        Label("🪞 Reflexivverben - Quiz", systemImage: "questionmark.circle")
                    }

                    NavigationLink {
                        ReflexiveQuizView(questions: reflexiveQuestionsSetA)
                    } label: {
                        Label("🧩 Quiz: Set A", systemImage: "list.bullet")
                    }

                    NavigationLink {
                        GerundioView()
                    } label: {
                        Label("🌀 Gerundio", systemImage: "arrow.triangle.2.circlepath")
                    }

                    NavigationLink {
                        ParaInfinitivoView()
                    } label: {
                        Label("🎯 Para + Infinitivo", systemImage: "target")
                    }

                    NavigationLink {
                        TimeView()
                    } label: {
                        Label("🕒 Uhrzeiten", systemImage: "clock")
                    }

                    NavigationLink {
                        WritingView()
                    } label: {
                        Label("✍️ Schreibübung: Mi día a día", systemImage: "pencil")
                    }
                }

                Section(header: Text("Fortschritt")) {
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Punkte insgesamt")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(totalScore) Punkte")
                                .font(.headline)
                        }
                        Spacer()
                        VStack(alignment: .leading) {
                            Text("Versuche")
                                .font(.caption)
                                .foregroundColor(.secondary)
                            Text("\(totalAttempts)")
                                .font(.headline)
                        }
                    }
                }

                Section(header: Text("Tipps")) {
                    Text("Lernplan: Dienstag – Reflexive Verben. Mittwoch – Gerundio & para + infinitivo. Donnerstag – Wiederholung.")
                }
            }
#if os(iOS)
            .listStyle(.insetGrouped)
#else
            .listStyle(.inset)
#endif
            .navigationTitle("🇪🇸 Spanisch Trainer")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
