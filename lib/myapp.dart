import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.supervised_user_circle, color: Colors.white),
        onPressed: null,
        backgroundColor: Colors.purple,
      ),
      backgroundColor: Colors.purpleAccent,
      appBar: new AppBar(
        backgroundColor: Colors.purple,
        title: new Row(
          children: <Widget>[
            new Text(
              'Sacffold Basics',
              style: new TextStyle(fontSize: 20.0, color: Colors.white),
            )
          ],
        ),
      ),
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new Card(
              child: new Container(
                child: new TextField(controller: new TextEditingController()),
                height: 150.0,
              ),
            ),
            new Card(
              child: new Container(
                height: 150.0,
              ),
            ),
            new Card(
              child: new Container(
                height: 150.0,
              ),
            ),
            new Card(
              child: new Container(
                height: 150.0,
              ),
            ),
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
        new FlatButton(onPressed: null, child: new Text("one")),
        new FlatButton(onPressed: null, child: new Text("two")),
        new FlatButton(onPressed: null, child: new Text("three")),
      ],
      bottomNavigationBar:
      new BottomAppBar(
        child:
        new Text('all copy right to aya'),),

//      BottomNavigationBar(items: <BottomNavigationBarItem>[
//        new BottomNavigationBarItem(
//          icon: new Icon(Icons.copyright),
//          title: new Text('ALL COPY RIGHTS RESIVE'),
//        ),
//        new BottomNavigationBarItem(
//          icon: new Icon(Icons.copyright),
//          title: new Text('ALL COPY RIGHTS RESIVE'),
//        ),
//        new BottomNavigationBarItem(
//          icon: new Icon(Icons.copyright),
//          title: new Text('ALL COPY RIGHTS RESIVE'),
//        )
//      ]),
    );
  }
}
