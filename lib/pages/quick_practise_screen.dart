import 'package:flutter/material.dart';

class QuickPracticeScreen extends StatefulWidget {
  const QuickPracticeScreen({super.key});

  @override
  State<QuickPracticeScreen> createState() => _QuickPracticeScreenState();
}

class _QuickPracticeScreenState extends State<QuickPracticeScreen> {
  // ---------------- JSON DATA ----------------
  final Map<String, dynamic> quickPracticeData = {
    "title": "Quick Practice",
    "description":
        "Answer 5 questions in 5 minutes to sharpen your SAT English skills.",
    "time_limit_minutes": 5,
    "questions": [
      {
        "id": 1,
        "category": "Grammar",
        "question": "Choose the correct sentence.",
        "options": [
          "A) Each of the students have a book.",
          "B) Each of the students has a book.",
          "C) Each of the student have a book.",
          "D) Each students has a book."
        ],
        "answer": "B",
        "explanation": "'Each' is singular, so the correct verb is 'has'."
      },
      {
        "id": 2,
        "category": "Vocabulary",
        "question": "What does 'meticulous' most nearly mean?",
        "options": [
          "A) Careless",
          "B) Quick",
          "C) Very detailed",
          "D) Loud"
        ],
        "answer": "C",
        "explanation": "Meticulous means showing great attention to detail."
      },
      {
        "id": 3,
        "category": "Reading",
        "question":
            "She grabbed an umbrella before leaving. What can you infer?",
        "options": [
          "A) It was sunny",
          "B) It was raining",
          "C) It was windy",
          "D) It was snowing"
        ],
        "answer": "B",
        "explanation": "An umbrella suggests rain."
      },
      {
        "id": 4,
        "category": "Writing",
        "question": "Which sentence is most concise?",
        "options": [
          "A) Due to the fact that it was late, he left.",
          "B) Because it was late, he left.",
          "C) It was late in time, so he left.",
          "D) He left at a late time."
        ],
        "answer": "B",
        "explanation":
            "'Because' replaces the wordy phrase 'due to the fact that'."
      },
      {
        "id": 5,
        "category": "Grammar",
        "question": "Choose the correct verb.",
        "options": [
          "A) The group of players are ready.",
          "B) The group of players is ready.",
          "C) The group are ready.",
          "D) The players group is ready."
        ],
        "answer": "B",
        "explanation": "'Group' is a singular collective noun."
      }
    ]
  };

  // ---------------- STATE ----------------
  int currentQuestionIndex = -1;
  String? selectedOption;
  bool showExplanation = false;
  int score = 0;

  List<dynamic> get questions => quickPracticeData["questions"];

  // ---------------- UI ----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Quick Practice")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: currentQuestionIndex == -1
            ? _startScreen()
            : currentQuestionIndex < questions.length
                ? _questionScreen()
                : _resultScreen(),
      ),
    );
  }

  // ---------------- START SCREEN ----------------
  Widget _startScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "⏱ ${quickPracticeData["time_limit_minutes"]}-Minute Practice",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          quickPracticeData["description"],
          style: const TextStyle(fontSize: 16),
        ),
        const Spacer(),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              setState(() {
                currentQuestionIndex = 0;
              });
            },
            child: const Text(
              "Start Now",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  // ---------------- QUESTION SCREEN ----------------
  Widget _questionScreen() {
    final question = questions[currentQuestionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Question ${currentQuestionIndex + 1} of ${questions.length}",
          style: const TextStyle(color: Colors.grey),
        ),
        const SizedBox(height: 6),
        Text(
          question["category"],
          style: const TextStyle(
              color: Colors.indigo, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Text(
          question["question"],
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),

        ...question["options"].map<Widget>((option) {
          final optionLetter = option.toString()[0];
          final isCorrect = optionLetter == question["answer"];
          final isSelected = option == selectedOption;

          Color bgColor = Colors.white;
          if (showExplanation && isSelected) {
            bgColor = isCorrect ? Colors.green.shade100 : Colors.red.shade100;
          }

          return Card(
            color: bgColor,
            child: ListTile(
              title: Text(option),
              onTap: showExplanation
                  ? null
                  : () {
                      setState(() {
                        selectedOption = option;
                        showExplanation = true;
                        if (isCorrect) score++;
                      });
                    },
            ),
          );
        }).toList(),

        const SizedBox(height: 12),

        if (showExplanation)
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              "Explanation: ${question["explanation"]}",
              style: const TextStyle(fontSize: 14),
            ),
          ),

        const Spacer(),

        if (showExplanation)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
              onPressed: () {
                setState(() {
                  currentQuestionIndex++;
                  selectedOption = null;
                  showExplanation = false;
                });
              },
              child: Text(
                currentQuestionIndex == questions.length - 1
                    ? "Finish"
                    : "Next Question",
                    style: TextStyle(color: Colors.white),
              ),
              
            ),
          )
      ],
    );
  }

  // ---------------- RESULT SCREEN ----------------
  Widget _resultScreen() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "🎉 Practice Complete!",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            "Your Score: $score / ${questions.length}",
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.indigo),
            onPressed: () {
              setState(() {
                currentQuestionIndex = -1;
                score = 0;
              });
            },
            child: const Text("Restart Practice"),
          )
        ],
      ),
    );
  }
}
