import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int currentIndex = 0;
  int score = 0;
  int? selectedOption;
  bool answered = false;

  final List<Map<String, dynamic>> questions = [
    {
      "question": "Choose the correct sentence:",
      "options": [
        "He go to school.",
        "He goes to school.",
        "He going to school.",
        "He gone to school."
      ],
      "answer": 1,
      "explanation":
          "The subject 'He' is singular, so the correct verb form is 'goes'."
    },
    {
      "question": "What is the meaning of the word 'abundant'?",
      "options": ["Rare", "Plentiful", "Weak", "Empty"],
      "answer": 1,
      "explanation":
          "'Abundant' means existing in large quantities or more than enough."
    },
  ];

  void selectAnswer(int index) {
    if (answered) return;

    setState(() {
      selectedOption = index;
      answered = true;
      if (index == questions[currentIndex]["answer"]) {
        score++;
      }
    });
  }

  void nextQuestion() {
    if (currentIndex < questions.length - 1) {
      setState(() {
        currentIndex++;
        selectedOption = null;
        answered = false;
      });
    } else {
      showResult();
    }
  }

  void showResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Completed 🎉"),
        content: Text(
          "Your Score: $score / ${questions.length}",
          style: const TextStyle(fontSize: 18),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() {
                currentIndex = 0;
                score = 0;
                selectedOption = null;
                answered = false;
              });
            },
            child: const Text("Restart"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Close"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Practice Quiz"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Progress
            LinearProgressIndicator(
              value: (currentIndex + 1) / questions.length,
            ),
            const SizedBox(height: 12),

            Text(
              "Question ${currentIndex + 1} of ${questions.length}",
              style: const TextStyle(color: Colors.grey),
            ),
            const SizedBox(height: 12),

            // Question
            Text(
              question["question"],
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),

            const SizedBox(height: 20),

            // Options
            ...List.generate(question["options"].length, (index) {
              final option = question["options"][index];
              final correctIndex = question["answer"];

              Color borderColor = Colors.grey.shade300;

              if (answered) {
                if (index == correctIndex) {
                  borderColor = Colors.green;
                } else if (index == selectedOption) {
                  borderColor = Colors.red;
                }
              }

              return GestureDetector(
                onTap: () => selectAnswer(index),
                child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: borderColor, width: 2),
                  ),
                  child: Text(
                    option,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              );
            }),

            const SizedBox(height: 10),

            // Explanation
            if (answered)
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.indigo.shade50,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  question["explanation"],
                  style: const TextStyle(fontSize: 14),
                ),
              ),

            const Spacer(),

            // Next button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: answered ? nextQuestion : null,
                child: Text(
                  currentIndex == questions.length - 1
                      ? "Finish Quiz"
                      : "Next Question",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
