import Foundation
import AVFoundation

final class SpeechManager {
    private let synthesizer = AVSpeechSynthesizer()

    func speak(_ text: String, language: String = "es-ES") {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: language)
        utterance.rate = 0.48
        synthesizer.speak(utterance)
    }
}

extension SpeechManager {
    static func speakExample(for verb: Verb) {
        let example = "Me " + verb.spanish + " cada mañana."
        SpeechManager().speak(example)
    }
}
