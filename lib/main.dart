import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(MaterialApp(home: Home()));
}

class Home extends StatefulWidget {
  // //This w;idget is the root of your application.
//flutter
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var questions = [
    {
      'question': 'How many states are there in India',
      'answers': ['20', '25', '28', '29'],
      'correctAnswer': '29'
    },
    {
      'question': 'How many union territories are there in India',
      'answers': ['7', '8', '28', '29'],
      'correctAnswer': '8'
    },
    {
      'question': 'How many days are there in a week',
      'answers': ['7', '8', '28', '29'],
      'correctAnswer': '7'
    },
    {
      'question': 'How many alphabets are there in english',
      'answers': ['7', '8', '26', '29'],
      'correctAnswer': '26'
    },
    {
      'question': 'How many states are there in India',
      'answers': ['20', '25', '28', '29'],
      'correctAnswer': '29'
    },
    {
      'question': 'How many union territories are there in India',
      'answers': ['7', '8', '28', '29'],
      'correctAnswer': '8'
    },
    {
      'question': 'How many days are there in a week',
      'answers': ['7', '8', '28', '29'],
      'correctAnswer': '7'
    },
    {
      'question': 'How many alphabets are there in english',
      'answers': ['7', '8', '26', '29'],
      'correctAnswer': '26'
    },
    {
      'question': 'How many states are there in India',
      'answers': ['20', '25', '28', '29'],
      'correctAnswer': '29'
    },
    {
      'question': 'How many union territories are there in India',
      'answers': ['7', '8', '28', '29'],
      'correctAnswer': '8'
    },
    {
      'question': 'How many days are there in a week',
      'answers': ['7', '8', '28', '29'],
      'correctAnswer': '7'
    },
    {
      'question': 'How many alphabets are there in english',
      'answers': ['7', '8', '26', '29'],
      'correctAnswer': '26'
    },
    {
      'question': 'How many states are there in India',
      'answers': ['20', '25', '28', '29'],
      'correctAnswer': '29'
    },
    {
      'question': 'How many union territories are there in India',
      'answers': ['7', '8', '28', '29'],
      'correctAnswer': '8'
    },
    {
      'question': 'How many days are there in a week',
      'answers': ['7', '8', '28', '29'],
      'correctAnswer': '7'
    },
  ];
  var amount = [
    '₹ 00',
    '₹ 5,000',
    '₹ 10,000',
    '₹ 20,000',
    '₹ 40,000',
    '₹ 80,000',
    '₹ 1,60,000',
    '₹ 3,20,000',
    '₹ 6,40,000',
    '₹ 12,50,000',
    '₹ 25 Lakhs',
    '₹ 50 Lakhs',
    '₹ 1 Crore',
    '₹ 3 Crore',
    '₹ 5 Crore',
    '₹ 7 Crore'
  ];
  int _questionIndex = 0;
  int i = 0;
  int score = 0;
  int total = 15;
  bool flag = true;
  final player = AudioCache();
  Widget build(BuildContext context) {
    if (_questionIndex == 15) {
      return Card(
          child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text('KBC'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Text('Congratulations!',
                      style: TextStyle(
                        fontSize: 44.0,
                        color: Colors.black87,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Text('You Have Won 7 crore Rupees!',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.green[400],
                      ))),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            player.play('audio/clicksound.mp3');
            setState(() {
              score = 0;
              i = 0;
              _questionIndex = 0;
            });
          },
          label: Text('Play Again'),
        ),
      ));
    } else if (flag) {
      return Scaffold(
          backgroundColor: Colors.grey[300],
          appBar: AppBar(
            centerTitle: true,
            title: Text('KBC'),
          ),
          body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.fromLTRB(16.0,32.0, 16.0, 2.0),
                  child: Text(amount[_questionIndex+1],
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                      )),
                ),

                Container(
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                  child: Text(
                      'Q${_questionIndex + 1}. ${questions[_questionIndex]['question']}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.black,
                      )),
                ),

                ...(questions[_questionIndex]['answers'] as List<String>)
                    .map((option) {
                  return GestureDetector(
                    child: Card(
                      margin: EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(option),
                      ),
                    ),
                    onTap: () {
                      player.play('audio/clicksound.mp3');
                      if (questions[_questionIndex]['correctAnswer'] !=
                          option) {
                        flag = false;
                      } else {
                        _questionIndex++;
                        // RenderErrorBox.backgroundColor.green;
                      }

                      setState(() {});
                    },
                  );
                }),
                Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.fromLTRB(16.0,32.0, 16.0, 2.0),
                  child: Text('Won:- ${amount[_questionIndex]}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Colors.green,
                      )),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                  width: double.infinity,
                  height: 50,
                  child: LinearPercentIndicator(
                    width: 350,
                    lineHeight: 14.0,
                    percent: (100 / total) / 100 * _questionIndex,
                    backgroundColor: Colors.grey,
                    progressColor: Colors.green,
                  ),
                )
                //  for (i = 0; i < 4; i++)
                // questionTemplate(options[counter][i], i),
              ]));
    } else {
      return Card(
          child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text('KBC'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Text('Wrong Answer!',
                      style: TextStyle(
                        fontSize: 44.0,
                        color: Colors.black87,
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Text('You Won ${amount[_questionIndex]}',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.red[400],
                      ))),
            ),
            /* SafeArea(
              child: FlatButton(
                child: Text("play "),
                onPressed: () {
                  player.play('audio/clicksound.mp3');
                },
              ),
            ),*/
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            player.play('audio/clicksound.mp3');
            setState(() {
              score = 0;
              i = 0;
              flag = true;
              _questionIndex = 0;
            });
          },
          label: Text('Play Again'),
        ),
      ));
    }
  }
}
/*
  @override
  Widget build(BuildContext context) {
    if (counter < 4) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text('KBC'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
              child: Text(questions[counter],
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  )),
            ),
            for (i = 0; i < 4; i++) questionTemplate(options[counter][i], i),
          ],
        ),
      );
    } else {
      return Card(
          child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text('KBC'),
        ),
        body: Column(
          children: <Widget>[
            questionTemplate('Congrats!!!', 0),
            questionTemplate('Your score = $score / 4', 0),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              score = 0;
              i = 0;
              counter = 0;
            });
          },
          label: Text('Play Again'),
        ),
      ));
    }
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
floatingActionButton: Padding(
            padding: const EdgeInsets.fromLTRB(32.0, 0.0, 0.0, 0.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        counter -= 1;
                        i=0;
                        if (counter == -1) counter = 3;
                      });
                    },
                    label: Text('Back'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  FloatingActionButton.extended(
                    onPressed: () {
                      setState(() {
                        i=0;
                        counter += 1;
                      });
                    },
                    label: Text('Next'),
                  )
                ]),
          )*/
