import 'package:flutter/material.dart';
import 'package:flutter_codigo_quizapp/quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [
    //ESTA LISTA ES PARA CREAR LOS ICONOS O CHECK DE CORRECTO O X DE ERROR.
  ];

  QuizBrain quizBrain = QuizBrain();

  checkAnswer(bool userAnswer) {
    if (quizBrain.isFinishQuinz() == true) {
      //El Quiz a Finalizado

      Alert(
        context: context,
        type: AlertType.success,
        title: "QuizApp",
        desc: "El Quiz a Finalizado",
        buttons: [
          DialogButton(
            child: Text(
              "Aceptar",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();

      quizBrain.retasQuinz();//reiniciamos el quinz
      scoreKeeper.clear();//para limpiar la lista de iconos almacenados en la parte de abajo de los botones.
      setState(() {

      });



    } else {
      bool correctAnswer = quizBrain.getQuestionAnswer();

      quizBrain.nextQuestion();

      if (correctAnswer == userAnswer) {
        scoreKeeper.add(Icon(
          Icons.check,
          color: Colors.greenAccent,
        ));
      } else {
        scoreKeeper.add(Icon(
          Icons.close,
          color: Colors.red,
        ));
      }
      ;

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff2b2d42),
      appBar: AppBar(
        title: Text("QuizApp"),
        backgroundColor: Colors.black12,
        centerTitle: true,
        elevation: 8.4,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  quizBrain.getQuestionText(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
               checkAnswer(true);


                },
                child: Text(
                  "Verdadero",
                ),
                color: Colors.greenAccent,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                onPressed: () {
                  checkAnswer(false);
                },
                child: Text(
                  "Falso",
                ),
                color: Colors.redAccent,
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          ),
        ],
      ),
    );
  }
}
