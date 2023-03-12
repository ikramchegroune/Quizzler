import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizeBrain quizeBrain=QuizeBrain();

void main() =>runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: const SafeArea(
          child:Padding(
            padding:EdgeInsets.symmetric(horizontal: 4.0),
            child: QuizlerPage(),
            ),
            ),
      ),
    );
  }
}
class QuizlerPage extends StatefulWidget {
  const QuizlerPage({super.key});

  @override
  State<QuizlerPage> createState() => _QuizlerPageState();
}

class _QuizlerPageState extends State<QuizlerPage> {
  List<Icon> scoreKeeper=[];
  void checkAnswer(bool userPickedAnswer){

   bool correctAnswer=quizeBrain.getQuestionAnswer();

    setState(() {
      if(quizeBrain.isFinished()==true ){
      Alert(
        context: context,
        title: "Quiz is over",
        desc: 'This is the end of the Quize'
      ).show();
      quizeBrain.reset();
      scoreKeeper=[]; 
      }
      else {
        if(userPickedAnswer == correctAnswer){
         scoreKeeper.add(Icon(Icons.check,
          color: Colors.green,
          ),
          );
          }
          else{
          scoreKeeper.add(Icon(Icons.close,
          color: Colors.red,
          ),);

          }
          quizeBrain.nextQuestion();
          }
        });
   }
 
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
       Expanded(
          child: Padding(
             padding:const EdgeInsets.all(10.0),
            child: Center(
              child: Text(quizeBrain.getQuestionText(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              ),
            ),
            ),
            ),
       SizedBox(
        width: 40.0,
        height: 90.0,
         child: Expanded(
           child: Padding(
            padding: const EdgeInsets.all(15.0),
             child: TextButton(
               style: TextButton.styleFrom(backgroundColor: Colors.green,
               ),
               child:const Text('True',
               style: TextStyle(color: Colors.white,
               fontSize: 20.0,
               ),
               ),
               onPressed: () {
                checkAnswer(true);
                 
               }, 
               ),
           ),
             ),
       ),
       SizedBox(
        width: 40.0,
        height: 90.0,
        child: Expanded(
                     child: Padding(
         padding: const EdgeInsets.all(15.0),
         child: TextButton(
           style: TextButton.styleFrom(backgroundColor: Colors.red,
           ),
           child: const Text('False',
           style: TextStyle(color: Colors.white,
           fontSize: 20.0,
           ),
           ),
           onPressed: () {
            checkAnswer(false);
           }, 
           ),
          ),
         ),
       ),
       SizedBox(
        height: 30.0,
        width:6.0,
        child: Row(
          children: scoreKeeper
         ),
       )



      ],




    );
  }
}