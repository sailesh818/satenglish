import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class LessonScreen extends StatefulWidget {
  final Map<String, dynamic> lessonData;

  const LessonScreen({super.key, required this.lessonData});

  /// Utility to load JSON file from assets
  static Future<Map<String, dynamic>> loadFromAsset(String path) async {
    final jsonStr = await rootBundle.loadString(path);
    return jsonDecode(jsonStr);
  }

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  // Keep track of which question has been answered correctly
  final Map<int, String> _selectedAnswers = {};

  @override
  Widget build(BuildContext context) {
    final title = widget.lessonData['title'] ?? 'Lesson';
    final description = widget.lessonData['description'] ?? '';
    final content = widget.lessonData['content'] as List<dynamic>? ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description.isNotEmpty)
              Text(
                description,
                style: const TextStyle(
                    fontSize: 16, color: Colors.grey, height: 1.5),
              ),
            const SizedBox(height: 20),
            ...List.generate(content.length, (index) {
              final section = content[index];
              return _buildSection(index, section);
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSection(int index, Map<String, dynamic> section) {
    final heading = section['heading'] ?? '';
    final text = section['text'] ?? '';
    final code = section['code'] ?? '';
    final options = section['options'] as List<dynamic>?; // For questions
    final answer = section['answer'] as String?;
    final hint = section['hint'] as String?;
    final explanation = section['explanation'] as String?;

    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (heading.isNotEmpty)
              Text(
                heading,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            if (text.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16, height: 1.5),
                ),
              ),
            if (code.isNotEmpty)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    code,
                    style: const TextStyle(
                      fontFamily: 'Courier',
                      fontSize: 14,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            if (options != null && options.isNotEmpty)
              _buildPracticeQuestion(
                  index, options, answer, hint, explanation),
          ],
        ),
      ),
    );
  }

  /// Builds practice questions with inline feedback
  Widget _buildPracticeQuestion(
    int questionIndex,
    List<dynamic> options,
    String? answer,
    String? hint,
    String? explanation,
  ) {
    final selected = _selectedAnswers[questionIndex];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(
          "Question ${questionIndex + 1}",
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.indigo),
        ),
        const SizedBox(height: 8),
        ...options.map((option) {
          final isSelected = selected == option;
          final isCorrect = option == answer;
          Color? buttonColor;
          if (selected != null) {
            if (isCorrect) buttonColor = Colors.green.shade200;
            if (isSelected && !isCorrect) buttonColor = Colors.red.shade200;
          }

          return Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor ?? Colors.indigo.shade50,
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
              ),
              onPressed: selected == null
                  ? () {
                      setState(() {
                        _selectedAnswers[questionIndex] = option;
                      });
                    }
                  : null, // Lock answer after selection
              child: Text(option, style: const TextStyle(fontSize: 16)),
            ),
          );
        }).toList(),
        if (selected != null) ...[
          const SizedBox(height: 8),
          if (hint != null)
            Text("💡 Hint: $hint", style: const TextStyle(color: Colors.grey)),
          if (explanation != null)
            Padding(
              padding: const EdgeInsets.only(top: 4),
              child:
                  Text("📖 Explanation: $explanation", style: const TextStyle(color: Colors.black87)),
            ),
        ],
      ],
    );
  }
}
