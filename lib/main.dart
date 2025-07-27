import 'package:flutter/material.dart';

void main() => runApp(StyledQuiz());

class StyledQuiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizHome(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
    );
  }
}

class QuizHome extends StatefulWidget {
  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  int currentIndex = 0;
  int score = 0;

  List<Map<String, Object>> questions = [
    {
      'question': "What is Flutter?",
      'options': ["Framework", "OS", "Game", "Browser"],
      'answer': "Framework"
    },
    {
      'question': "Who developed Dart?",
      'options': ["Apple", "Microsoft", "Google", "Meta"],
      'answer': "Google"
    },
    {
      'question': "What is StatefulWidget?",
      'options': ["Static", "Changing", "Style", "Animation"],
      'answer': "Changing"
    },
    {
      'question': "Which language is used by Flutter?",
      'options': ["Kotlin", "Swift", "Dart", "JavaScript"],
      'answer': "Dart"
    },
    {
      'question': "Which widget is used for layout in Flutter?",
      'options': ["Row", "Text", "AppBar", "SnackBar"],
      'answer': "Row"
    },
    {
      'question': "Which company created Flutter?",
      'options': ["Facebook", "Google", "Amazon", "Apple"],
      'answer': "Google"
    },
    {
      'question': "What does setState() do?",
      'options': [
        "Saves data",
        "Updates UI",
        "Deletes widget",
        "Reloads app"
      ],
      'answer': "Updates UI"
    },
    {
      'question': "Which of these is stateless?",
      'options': [
        "TextField",
        "Container",
        "StatefulWidget",
        "TextFormField"
      ],
      'answer': "Container"
    },
    {
      'question': "Which widget is used to scroll content?",
      'options': ["Column", "ListView", "Row", "Stack"],
      'answer': "ListView"
    },
    {
      'question': "Flutter is mainly used for?",
      'options': [
        "Web development",
        "Desktop apps",
        "Mobile app dev",
        "Game dev"
      ],
      'answer': "Mobile app dev"
    },
  ];

  void checkAnswer(String selected) {
    if (selected == questions[currentIndex]['answer']) {
      score++;
    }
    setState(() {
      currentIndex++;
    });
  }

  void restartQuiz() {
    setState(() {
      currentIndex = 0;
      score = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool quizEnded = currentIndex >= questions.length;

    return Scaffold(
      appBar: AppBar(title: Text(" flutter Quiz")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: quizEnded
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "🎉 Quiz Completed!",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Your Score: $score / ${questions.length}",
                      style: TextStyle(fontSize: 22),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: restartQuiz,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text("Restart Quiz",
                          style: TextStyle(fontSize: 16)),
                    )
                  ],
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Q${currentIndex + 1}/${questions.length}: ${questions[currentIndex]['question']}",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 20),
                  ...((questions[currentIndex]['options'] as List<String>).map(
                    (option) => Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 12),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.teal[400],
                          foregroundColor: Colors.white,
                          padding: EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        onPressed: () => checkAnswer(option),
                        child: Text(option,
                            style: TextStyle(fontWeight: FontWeight.w500)),
                      ),
                    ),
                  ))
                ],
              ),
      ),
    );
  }
}
