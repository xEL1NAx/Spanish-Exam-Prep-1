import SwiftUI

struct ParaInfinitivoView: View {
    @State private var showExamples = false
    var body: some View {
        VStack(spacing: 14) {
            Text("Para + Infinitivo")
                .font(.title2)
                .bold()

            Text("Verwendung: Zweck/Ziel ausdrücken → para + Infinitiv\nBeisp.: Estudio para sacar buenas notas. (Ich lerne, um gute Noten zu bekommen.)")
                .padding()
                .multilineTextAlignment(.leading)
                .background(.ultraThinMaterial)
                .cornerRadius(12)

            Button("Mehr Beispiele") {
                showExamples.toggle()
            }
            .buttonStyle(.borderedProminent)

            if showExamples {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Voy al gimnasio para hacer deporte.")
                    Text("Trabajo para ganar dinero.")
                    Text("Estudio para aprobar el examen.")
                }
                .padding()
                .background(.thinMaterial)
                .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Para + Infinitivo")
    }
}
