import 'package:flutter/material.dart';
import 'package:task_week2/apl/cek_login.dart';

class HomePage extends StatefulWidget {
  final String nama;
  final String password;

  HomePage({Key key, @required this.nama, @required this.password})
      : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
          backgroundColor: Colors.red,
        ),
        body: Center(
            child: Column(
          children: <Widget>[
            SizedBox(height: 20,),
            Text('Welcome : ${widget.nama}'),
            Text('Password anda : ' + widget.password),
            SizedBox(
              height: 10,
            ),
            RaisedButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => CekLogin()));
              },
              child: Text("Sign Out"),
            )
          ],
        )));
  }
}
