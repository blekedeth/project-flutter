import 'package:flutter/material.dart';
import 'package:week2/ui/PageTwo.dart';
import 'package:week2/ui/PageColumn.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        '/page2': (BuildContext context) => PageColumn(),

      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Navigator"),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            MaterialButton(
              color: Colors.yellow,
              child: Text("Page 2"),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PageTwo(),
                    ));
              },
            ),
            RaisedButton(
                color: Colors.amber,
                child: Text('Page beda file'),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PageColumn()));
                }),
            FlatButton(
              color: Colors.lightGreenAccent,
              child: Text('Navigator Push Named'),
              onPressed: () {
                Navigator.of(context).pushNamed('/page2');
              },
            )
          ],
        ));
  }
}
