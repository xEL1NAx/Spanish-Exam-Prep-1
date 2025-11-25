import SwiftUI

struct WritingView: View {
    @State private var text = ""
    @State private var feedback: String = ""
    @State private var showFeedback = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 12) {
                Text("Schreibübung – Mi día a día")
                    .font(.title2)
                    .bold()

                Text("Schreibe einen Text (150–200 Wörter) über deinen Alltag. Verwende Reflexivverben, Zeitangaben und Gerundio.")
                    .padding(.bottom, 8)

                TextEditor(text: $text)
                    .frame(minHeight: 220)
                    .overlay(RoundedRectangle(cornerRadius: 12).stroke(.gray.opacity(0.3)))

                HStack {
                    Button("Beispiel einfügen") {
                        text = exampleText
                    }
                    Spacer()
                    Button("Feedback prüfen") {
                        feedback = quickCheck(text: text)
                        showFeedback = true
                    }
                    .buttonStyle(.borderedProminent)
                }

                if showFeedback {
                    VStack(alignment: .leading, spacing: 6) {
                        Text("Schnelles Feedback:")
                            .bold()
                        Text(feedback)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding()
                    .background(.thinMaterial)
                    .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
        }
        .navigationTitle("Schreibübung")
    }

    var exampleText: String {
        """
        Me levanto a las siete de la mañana y me ducho rápidamente. Después me visto y desayuno con mi familia. Normalmente tomo un café con leche y una tostada. A las ocho salgo para ir al instituto. Durante el día estudio matemáticas, inglés e historia. Después de las clases, hago los deberes y me relajo escuchando música. Por la noche ceno con mi familia y me acuesto a las diez y media.
        """
    }

    func quickCheck(text: String) -> String {
        let lower = text.lowercased()
        var notes: [String] = []

        // simple heuristics
        if lower.contains("me ") == false && lower.contains("me.") == false {
            notes.append("Versuche, mehr reflexive Verben mit 'me/te/se' einzubauen.")
        }
        if lower.count < 120 {
            notes.append("Der Text ist etwas kurz — versuche 150–200 Wörter.")
        }
        if lower.contains("para ") == false {
            notes.append("Füge einen Satz mit 'para + Infinitiv' hinzu, z. B. 'Estudio para sacar buenas notas.'")
        }
        if lower.contains("estoy") || lower.contains("estamos") {
            // ok
        } else {
            notes.append("Benutze wenigstens einen Satz mit 'estar + gerundio' (z. B. 'Estoy estudiando').")
        }

        if notes.isEmpty {
            return "Gute Arbeit! Dein Text enthält reflexive Verben, Para-Konstruktionen und Gerundio."
        } else {
            return notes.joined(separator: "\n• ")
        }
    }
}
