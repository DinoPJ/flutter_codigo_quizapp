import 'package:flutter_codigo_quizapp/questions.dart';

class QuizBrain {
  List<Question> _questions = [
    //LISTA PRIVADA PARA SOLO SER UTILIZADA EN ESTA CLASE

    //se crea un lista de la clase creada Question, del file questions.dart.
    Question(questionText: "El Hombre LLego a la luna", questionAnswer: true),
    Question(questionText: "Haz almorzado algo", questionAnswer: true),
    Question(questionText: "Sientes Frio", questionAnswer: false),
    Question(questionText: "vas a Salir Mañana", questionAnswer: true),
  ];

  int _questionNumber =
      0; //contador para que al momento de dar click en verdadero o falso cambie la pregunta. en uno o se disminuya
  // y se accede de acuerdo a la lista su propiedad => question[questionNumber(0)], y mostrara la pregunta en su orden.

  nextQuestion() {
    if (_questionNumber < _questions.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questions[_questionNumber].questionText;
  }

  bool getQuestionAnswer() {
    return _questions[_questionNumber].questionAnswer;
  }

  int getTotalQuestion() {
    return _questions.length;
  }

  //VERIFICAR SI EL QUINZ A FINALIZADO
  bool isFinishQuinz() {
    if (_questionNumber >= _questions.length - 1) {
      return true;
    }

    return false;
  }

//METODO PARA REINICIAR EL QUINZ

  void retasQuinz() {
    _questionNumber = 0;
  }
}
