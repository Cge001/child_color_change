import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Child Color Change'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String colorStr;

  int color;

  AssetImage image;

  @override
  void initState() {
    super.initState();
    colorStr = '0xff';
    color = 0xff9893bc;
    image = AssetImage("images/child1.jpg");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
//          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 30, top: 50),
                  padding: EdgeInsets.all(70),
                  decoration: BoxDecoration(
                    color: Color(color),
                    borderRadius: const BorderRadius.all(Radius.circular(6.0)),
                  ),
                  child: Text(
                    '',
                    style: new TextStyle(height: 0),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, top: 50),
                  child: Image(
                    width: 100,
                    height: 100,
                    fit: BoxFit.fill,
                    image: image,
                  ),
                ),
              ],
            ),

            new Container(
              child: new Text(
                colorStr,
                style: new TextStyle(color: Colors.red, fontSize: 15),
              ),
              margin: EdgeInsets.only(top: 20),
            ),

            ///
            new Container(
              margin: EdgeInsets.only(top: 50, left: 20),
              child: new Row(children: <Widget>[
                _buildNumBtn('1'),
                _buildNumBtn('2'),
                _buildNumBtn('3'),
                _buildNumBtn('4'),
              ]),
            ),
            new Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              child: new Row(children: <Widget>[
                _buildNumBtn('5'),
                _buildNumBtn('6'),
                _buildNumBtn('7'),
                _buildNumBtn('8'),
              ]),
            ),
            new Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              child: new Row(children: <Widget>[
                _buildNumBtn('9'),
                _buildNumBtn('0'),
                _buildLetterBtn('A'),
                _buildLetterBtn('B'),
              ]),
            ),
            new Container(
              margin: EdgeInsets.only(top: 30, left: 20),
              child: new Row(children: <Widget>[
                _buildLetterBtn('C'),
                _buildLetterBtn('D'),
                _buildLetterBtn('E'),
                _buildLetterBtn('F'),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showChild();
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  ///
  _buildNumBtn(String text) {
    return new Container(
      child: new CupertinoButton(
          padding: EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
          child: Text(
            text,
            style: TextStyle(
              height: 1,
              color: Colors.white,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          color: Colors.grey,
          onPressed: () {
            _click(text);
          }),
      margin: EdgeInsets.only(left: 20),
    );
  }

  ///
  _buildLetterBtn(String text) {
    return new Container(
      child: new CupertinoButton(
          padding: EdgeInsets.only(left: 20, right: 20, top: 13, bottom: 13),
          child: Text(
            text,
            style: TextStyle(
              height: 1,
              color: Colors.white,
              fontSize: 30,
            ),
            textAlign: TextAlign.center,
          ),
          borderRadius: BorderRadius.all(Radius.circular(6.0)),
          color: Colors.indigo,
          onPressed: () {
            _click(text);
          }),
      margin: EdgeInsets.only(left: 20),
    );
  }

  ///
  void _click(String s) {
    int length = colorStr.length;
    setState(() {
      if (length < 10) {
        colorStr += s;
      } else {
        if (length == 10) {
          colorStr = '0xff' + s;
        }
      }
      color = int.parse(colorStr);
    });
  }

  ///
  void _showChild() {
    int index = Random().nextInt(5) + 1;
    image = AssetImage("images/child" + index.toString() + ".jpg");
    setState(() {});
  }
}
