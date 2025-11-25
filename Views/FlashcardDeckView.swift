import SwiftUI
import AVFoundation

struct FlashcardDeckView: View {
    @State private var index: Int = 0
    @State private var shuffledVerbs: [Verb] = []
    @State private var showBack: Bool = false
    let verbs: [Verb]
    private let speech = SpeechManager()

    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.ultraThinMaterial)
                    .frame(height: 280)
                    .shadow(radius: 6)

                if shuffledVerbs.indices.contains(index) {
                    VStack(spacing: 8) {
                        Text(showBack ? shuffledVerbs[index].german : shuffledVerbs[index].spanish)
                            .font(.system(size: 28, weight: .semibold))
                            .multilineTextAlignment(.center)
                            .padding()

                        if showBack {
                            Text(shuffledVerbs[index].example)
                                .font(.body)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal)
                        } else {
                            Text("Tippe auf die Karte, um die Rückseite zu sehen")
                                .font(.footnote)
                                .foregroundColor(.secondary)
                        }
                    }
                    .padding()
                } else {
                    VStack(spacing: 8) {
                        Text("Lade Karten…")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .padding()
                        Text("Bitte einen Moment.")
                            .font(.footnote)
                            .foregroundColor(.secondary)
                    }
                    .padding()
                }
            }
            .padding(.horizontal)
            .onTapGesture {
                if shuffledVerbs.indices.contains(index) {
                    withAnimation(.spring()) { showBack.toggle() }
                }
            }
            .onAppear {
                if shuffledVerbs.isEmpty {
                    shuffledVerbs = verbs.shuffled()
                }
            }

            HStack {
                Button {
                    withAnimation { previous() }
                } label: {
                    Label("Zurück", systemImage: "chevron.left")
                }
                .disabled(index == 0 || shuffledVerbs.isEmpty)
                Spacer()
                Text("\(shuffledVerbs.isEmpty ? 0 : index + 1) / \(shuffledVerbs.count)")
                Spacer()
                Button {
                    withAnimation { next() }
                } label: {
                    Label("Weiter", systemImage: "chevron.right")
                }
                .disabled(shuffledVerbs.isEmpty || index >= shuffledVerbs.count - 1)
            }
            .padding(.horizontal, 32)

            HStack {
                Button {
                    speech.speak(shuffledVerbs[index].spanish)
                } label: {
                    Label("🔊 Aussprache", systemImage: "speaker.wave.2.fill")
                }
                .disabled(!shuffledVerbs.indices.contains(index))

                Spacer()

                Button {
                    // show example TTS
                    speech.speak(shuffledVerbs[index].example)
                } label: {
                    Label("🔊 Beispiel", systemImage: "play.circle")
                }
                .disabled(!shuffledVerbs.indices.contains(index))
            }
            .padding(.horizontal, 32)

            Spacer()
        }
        .navigationTitle("Vokabeltrainer")
        .padding(.vertical)
    }

    private func next() {
        if index < shuffledVerbs.count - 1 {
            index += 1
            showBack = false
        }
    }

    private func previous() {
        if index > 0 {
            index -= 1
            showBack = false
        }
    }

    // Simple automatic example sentence generator
    func generateExample(for verb: Verb) -> String {
        return "Me " + verb.spanish + " cada mañana." // placeholder template
    }
}

