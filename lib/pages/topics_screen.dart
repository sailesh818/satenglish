import 'package:flutter/material.dart';
import 'package:sat_english/pages/lesson_screen.dart';

class TopicsScreen extends StatefulWidget {
  const TopicsScreen({super.key});

  @override
  State<TopicsScreen> createState() => _TopicsScreenState();
}

class _TopicsScreenState extends State<TopicsScreen> {
  // Mapping topics to their JSON files
  static const Map<String, String> topicJsonMap = {
    // Reading
    "Main Idea & Central Theme": "assets/reading/main_idea_central_theme.json",
    "Inference Questions": "assets/reading/inference_questions.json",
    "Vocabulary in Context": "assets/reading/vocabulary_in_context.json",
    "Author’s Tone & Purpose": "assets/reading/authors_tone_purpose.json",
    "Evidence-Based Questions": "assets/reading/evidence_based_questions.json",
    "Data & Graph Interpretation": "assets/reading/data_graph_interpretation.json",
    "Passage Comparisons": "assets/reading/passage_comparisons.json",

    // Writing & Language
    "Subject–Verb Agreement": "assets/writing/subject_verb_agreement.json",
    "Verb Tense & Voice": "assets/writing/verb_tense_voice.json",
    "Pronouns & Modifiers": "assets/writing/pronouns_modifiers.json",
    "Sentence Structure": "assets/writing/sentence_structure.json",
    "Punctuation Rules": "assets/writing/punctuation_rules.json",
    "Parallelism": "assets/writing/parallelism.json",
    "Conciseness & Style": "assets/writing/conciseness_style.json",

    // Vocabulary
    "High-Frequency SAT Words": "assets/vocabulary/high_frequency_words.json",
    "Word Roots, Prefixes & Suffixes": "assets/vocabulary/word_roots_prefixes_suffixes.json",
    "Synonyms & Antonyms": "assets/vocabulary/synonyms_antonyms.json",
    "Contextual Word Meaning": "assets/vocabulary/contextual_word_meaning.json",
    "Commonly Confused Words": "assets/vocabulary/commonly_confused_words.json",
  };

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Topics & Lessons",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          const Text(
            "Master every SAT English concept",
            style: TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 20),

          _topicSection(
            title: "Reading",
            icon: Icons.menu_book,
            color: Colors.indigo,
            topics: [
              "Main Idea & Central Theme",
              "Inference Questions",
              "Vocabulary in Context",
              "Author’s Tone & Purpose",
              "Evidence-Based Questions",
              "Data & Graph Interpretation",
              "Passage Comparisons",
            ],
          ),

          // _topicSection(
          //   title: "Writing & Language",
          //   icon: Icons.edit,
          //   color: Colors.orange,
          //   topics: [
          //     "Subject–Verb Agreement",
          //     "Verb Tense & Voice",
          //     "Pronouns & Modifiers",
          //     "Sentence Structure",
          //     "Punctuation Rules",
          //     "Parallelism",
          //     "Conciseness & Style",
          //   ],
          // ),

          _topicSection(
            title: "Vocabulary",
            icon: Icons.book,
            color: Colors.green,
            topics: [
              "High-Frequency SAT Words",
              "Word Roots, Prefixes & Suffixes",
              "Synonyms & Antonyms",
              "Contextual Word Meaning",
              "Commonly Confused Words",
            ],
          ),
        ],
      ),
    );
  }

  Widget _topicSection({
    required String title,
    required IconData icon,
    required Color color,
    required List<String> topics,
  }) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      elevation: 3,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ExpansionTile(
        leading: CircleAvatar(
          backgroundColor: color.withOpacity(0.15),
          child: Icon(icon, color: color),
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        subtitle: Text("${topics.length} lessons"),
        children: topics.map((topic) {
          return ListTile(
            leading: const Icon(Icons.play_circle_outline),
            title: Text(topic),
            trailing: const Icon(Icons.arrow_forward_ios, size: 14),
            onTap: () async {
              final path = topicJsonMap[topic];
              if (path != null) {
                // Wait for JSON to load
                final lessonData = await LessonScreen.loadFromAsset(path);

                if (!mounted) return; // Check if widget is still in tree
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => LessonScreen(lessonData: lessonData),
                  ),
                );
              }
            },
          );
        }).toList(),
      ),
    );
  }
}
