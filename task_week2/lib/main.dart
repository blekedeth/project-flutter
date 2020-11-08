import 'package:flutter/material.dart';
import 'package:task_week2/apl/hitung_umur.dart';
import 'package:task_week2/apl/cek_login.dart';
import 'package:task_week2/apl/bangun_datar.dart';

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
      debugShowCheckedModeBanner: false,
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
          title: Text("Task Week 2"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              MaterialButton(
                color: Colors.amber,
                child: Text("Aplikasi Hitung Umur"),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HitungUmur(),
                      ));
                },
              ),
              RaisedButton(
                  color: Colors.amber,
                  child: Text('Cek Login'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CekLogin()));
                  }),
              RaisedButton(
                  color: Colors.amber,
                  child: Text('Hitung Bangun Datar'),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => BangunDatar()));
                  }),
            ],
          ),
        ));
  }
}
