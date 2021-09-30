import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;

  List<Question> _questionBank = [
    Question(
      text: 'Some cats are actually allergic to humans',
      answer: true,
    ),
    Question(
      text: 'You can lead a cow down stairs but not up stairs.',
      answer: false,
    ),
    Question(
      text: 'Approximately one quarter of human bones are in the feet.',
      answer: true,
    ),
    Question(
      text: 'A slug\'s blood is green.',
      answer: true,
    ),
    Question(
      text: 'Buzz Aldrin\'s mother\'s maiden name was \"Moon\".',
      answer: true,
    ),
    Question(
      text: 'It is illegal to pee in the Ocean in Portugal.',
      answer: true,
    ),
    Question(
      text:
          'No piece of square dry paper can be folded in half more than 7 times.',
      answer: false,
    ),
    Question(
      text:
          'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.',
      answer: true,
    ),
    Question(
      text:
          'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.',
      answer: false,
    ),
    Question(
      text:
          'The total surface area of two human lungs is approximately 70 square metres.',
      answer: true,
    ),
    Question(
      text: 'Google was originally called \"Backrub\".',
      answer: true,
    ),
    Question(
      text:
          'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.',
      answer: true,
    ),
    Question(
      text:
          'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.',
      answer: true,
    ),
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].text;
  }

  bool getCorrectAnswer() {
    return _questionBank[_questionNumber].answer;
  }

  bool isFinished() {
    print(_questionNumber == _questionBank.length - 1);
    return _questionNumber == _questionBank.length - 1;
  }

  void reset() {
    _questionNumber = 0;
  }
}
