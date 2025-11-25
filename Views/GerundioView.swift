import SwiftUI

struct GerundioView: View {
    @State private var inputVerb: String = ""
    @State private var result: String = ""
    @State private var showHint = false

    var body: some View {
        VStack(spacing: 16) {
            Text("El gerundio – Bildung & Beispiele")
                .font(.title2)
                .bold()

            Text("Regeln:\n- -ar → -ando (hablar → hablando)\n- -er / -ir → -iendo (comer → comiendo, vivir → viviendo)\nVerwende: estar + gerundio (Estoy comiendo).")
                .padding()
                .multilineTextAlignment(.leading)
                .background(.ultraThinMaterial)
                .cornerRadius(12)

            TextField("Infinitiv eingeben (z. B. hablar)", text: $inputVerb)
                .textFieldStyle(.roundedBorder)
#if os(iOS)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(TextInputAutocapitalization.never)
#endif
                .padding(.horizontal)

            Button("Gerundio bilden") {
                result = makeGerundio(from: inputVerb)
            }
            .buttonStyle(.borderedProminent)

            if !result.isEmpty {
                Text("Gerundio: \(result)")
                    .font(.headline)
                    .padding()
            }

            Spacer()
            Button("Beispiele zufällig") {
                showHint.toggle()
            }
            .buttonStyle(.bordered)

            if showHint {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Estoy hablando. — Ich spreche gerade.")
                    Text("Estamos estudiando. — Wir lernen gerade.")
                    Text("Está comiendo. — Er/sie isst gerade.")
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(12)
            }
            Spacer()
        }
        .padding()
        .navigationTitle("Gerundio")
    }

    func makeGerundio(from infinitive: String) -> String {
        let s = infinitive.trimmingCharacters(in: .whitespacesAndNewlines).lowercased()
        guard s.count > 2 else { return "" }
        if s.hasSuffix("ar") {
            let stem = String(s.dropLast(2))
            return stem + "ando"
        } else if s.hasSuffix("er") || s.hasSuffix("ir") {
            let stem = String(s.dropLast(2))
            return stem + "iendo"
        } else {
            return "Unbekanntes Verb"
        }
    }
}

