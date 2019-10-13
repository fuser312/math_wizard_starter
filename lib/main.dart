import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(
    home: MathWizard(),
  ));
}

class MathWizard extends StatefulWidget {
  @override
  _MathWizardState createState() => _MathWizardState();
}

class _MathWizardState extends State<MathWizard> {
  final myController = TextEditingController();
  int num1 = Random().nextInt(100);
  int num2 = Random().nextInt(100);
  int score = 0;
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF28D62B),
          title: Text('MathWiz'),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                  Expanded(
                      flex: 4,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(8, 16, 0, 8),
                          alignment: Alignment.centerRight,
                          child: Text(
                            "$num1 + $num2 = ",
                            style: TextStyle(fontSize: 40, color: Colors.blue),
                          )
                      )
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      height: 40,
                      width: 32,
                      margin: EdgeInsets.fromLTRB(4, 8, 20, 8),
                      alignment: Alignment.centerRight,
                      child: TextField(
                        decoration: new InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(color: Colors.black, width: 1.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                            BorderSide(width: 1.0),
                          ),
                        ),
                        style: TextStyle(
                          fontSize: 24,color : Colors.blue
                        ),
                        controller: myController,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        autofocus: true,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(),
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: FlatButton(
                    color: Colors.green,
                    child: Text("Check", style: TextStyle(color: Colors.white)),
                    onPressed: () {
                      int sumValue = num1 + num2;
                      String sum = "$sumValue";
                      if (sum == myController.text) {
                        score = score + 10;
                      } else {
                        score = score - 5;
                      }
                      num1 = Random().nextInt(100);
                      num2 = Random().nextInt(100);
                      myController.text = "";
                      setState(() {});
                    },
                  ),
                )),
            Expanded(
                flex: 1,
                child: Container(
                  alignment: Alignment.topCenter,
                  child: ButtonTheme(
                    minWidth: 64,
                    child: FlatButton(
                      color: Colors.blue,
                      child: Text("Skip", style: TextStyle(color: Colors.white,)),
                      onPressed: () {
                        num1 = Random().nextInt(20);
                        num2 = Random().nextInt(20);
                        myController.text = "";
                        setState(() {});
                      },
                    ),
                  ),
                )
            ),
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Score: $score",
                      style: TextStyle(fontSize: 30, color: Colors.green)),
                )),
          ],
        ),
      ),
    );
  }
}