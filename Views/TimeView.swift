import SwiftUI

struct TimeView: View {
    @State private var hour: Int = 7
    @State private var minute: Int = 30
    @State private var spanishTime: String = ""

    var body: some View {
        VStack(spacing: 16) {
            Text("Uhrzeiten – Spanisch")
                .font(.title2)
                .bold()

            HStack {
                Stepper("Stunde: \(hour)", value: $hour, in: 0...23)
                Spacer()
            }
            HStack {
                Stepper("Minute: \(minute)", value: $minute, in: 0...59, step: 5)
                Spacer()
            }

            Button("Auf Spanisch anzeigen") {
                spanishTime = timeToSpanish(hour: hour, minute: minute)
            }
            .buttonStyle(.borderedProminent)

            if !spanishTime.isEmpty {
                Text(spanishTime)
                    .font(.title3)
                    .padding()
                    .background(.ultraThinMaterial)
                    .cornerRadius(10)
            }

            Spacer()
        }
        .padding()
        .navigationTitle("Uhrzeiten")
    }

    func timeToSpanish(hour: Int, minute: Int) -> String {
        // Simpler Text: use 12/24 rules in Spanish style
        let h = (hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour))
        if minute == 0 {
            return "Son las \(h) en punto"
        } else if minute == 15 {
            return "Son las \(h) y cuarto"
        } else if minute == 30 {
            return "Son las \(h) y media"
        } else if minute == 45 {
            let next = h == 12 ? 1 : h + 1
            return "Son las \(next) menos cuarto"
        } else {
            return String(format: "Son las %d y %02d", h, minute)
        }
    }
}
