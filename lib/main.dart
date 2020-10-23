import 'package:flutter/material.dart';

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
  List<String> question = [
    'Q1. Who was the first person to walk on the moon ?',
    'Q2. There are how many continents in the World ?',
    'Q3. There are how many Union Territories in India ?',
    'Q4. In RGB, What does the R stands for ?',
  ];
  Map<int, List<String>> options = {
    0: [
      'A. Isaac Newton',
      'B. Kalpana Chawla',
      'C. Sunita William',
      'D. Neil Armstrong'
    ],
    1: ['A. 6', 'B. 7', 'C. 8', 'D. 9'],
    2: ['A. 6', 'B. 7', 'C. 8', 'D. 9'],
    3: ['A. Ranbow', 'B. Red', 'C. Rat', 'D. Right'],
  };
  Map<int, int> ans = {
    0 : 3,
    1 : 1,
    2 : 2,
    3 : 1,
  };
  int counter = 0;
  int i=0;
  int score=0;
  Widget questionTemplate(String str, int i) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            FlatButton(onPressed: (){
              setState(() {
                if(counter <4 && ans[counter]==i){
                  score++;
                }
                i=0;
                counter += 1;
              });
            },
            child: Text(str,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.purple[600],
                )),
            color: Colors.white,
            hoverColor: Colors.black,
            splashColor: Colors.green,
            ),
          ],
        ),
      ),
    );
  }

  
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
                child: Text(question[counter],
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.black,
                    )),
              ),
      
              for (i = 0; i < 4; i++)
                questionTemplate(options[counter][i], i),
            ],
          ),
          
          );
    } 
    else {
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
              score=0;
              i=0;
              counter = 0;
            });
          },
          label: Text('Play Again'),
        ),
      )
      );
      

    }
    // This trailing comma makes auto-formatting nicer for build methods.
  }
}
/*floatingActionButton: Padding(
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