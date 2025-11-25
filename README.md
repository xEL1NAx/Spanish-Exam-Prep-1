# 🇪🇸 Spanish Exam Prep — iOS App

**Spanish Exam Prep** is a lightweight, fast, and interactive iOS application designed to help students study Spanish vocabulary, grammar, sentence structures, reflexive verbs, *gerundio*, time expressions, writing prompts, and more.  
All exercises are **randomized**, **cleanly structured**, and optimized for quick study sessions.

---

## 📱 Features

### 🔹 Flashcards  
- Randomized Spanish verb flashcards  
- Includes English translations  
- Swipe-based learning flow  

### 🔹 Reflexive Verb Quiz  
- Multiple-choice questions  
- Fully randomized question order  
- Correct/incorrect feedback  

### 🔹 Para + Infinitivo Trainer  
- Practice purpose clauses with *para + infinitivo*  
- Auto-shuffled on view load  

### 🔹 Time (La Hora) Trainer  
- Randomized time expressions  
- Natural Spanish phrasing  

### 🔹 Gerundio Exercises  
- Train *estar + gerundio*  
- Every task is randomized  

### 🔹 Writing Prompts  
- Random writing tasks  
- Great for exam preparation  

### 🎨 Simple SwiftUI Interface  
- Clean layout  
- Easy navigation  
- Custom app icon included  

---

## 🛠 Technologies Used

- **Swift 5+**
- **SwiftUI**
- **Xcode**
- Data-driven architecture  
- Built-in randomization logic  

---

## 📂 Project Structure

```

Spanish Exam Prep #1/
├── Models/
│   ├── Question.swift
│   ├── Verb.swift
│   └── (other data models)
│
├── Data/
│   ├── QuestionData.swift
│   ├── VerbData.swift
│   └── WritingData.swift
│
├── Views/
│   ├── FlashcardDeckView.swift
│   ├── ReflexiveQuizView.swift
│   ├── GerundioView.swift
│   ├── TimeView.swift
│   ├── WritingView.swift
│   └── MainMenuView.swift
│
├── SpanishTrainerApp.swift
└── Assets/
└── AppIcon.png

````

---

## 🔀 Randomization Logic

Every module uses standardized shuffle logic:

```swift
data.shuffled()
````

or:

```swift
.onAppear { data.shuffle() }
```

This guarantees:

* No two quiz sessions feel the same
* Card order stays unpredictable
* Better long-term exam retention

---

## 🚀 Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/spanish-exam-prep.git
```

### 2. Open in Xcode

```bash
open Spanish\ Exam\ Prep\ \#1.xcodeproj
```

### 3. Run the project

Select a simulator → **Run (⌘R)**.

---

## 📦 App Icon

The project includes a custom app icon located at:

```
/mnt/data/A_flat_design_app_icon_in_digital_vector_graphic_f.png
```

Replace it in `Assets.xcassets` if needed.

---

## 🧪 Future Improvements

* Add spaced repetition (SRS)
* Add progress tracking & statistics
* Voice/audio integration for verbs
* Larger writing prompt library
* More grammar modules

---

## 📄 License

Private educational project.
Not for commercial distribution unless permission is granted.

---

## ✨ Author

Created by **Elina Wolf**.
Designed as a Spanish exam study companion.
