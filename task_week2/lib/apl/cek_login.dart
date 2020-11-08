import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_week2/apl/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CekLogin(),
    );
  }
}

class CekLogin extends StatelessWidget {
  final myUsernameController = TextEditingController();
  final myPasswordController = TextEditingController();
  String nUsername, nPassword;

  //form
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Login'),
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Input Username';
                }
                return null;
              },
              controller: myUsernameController,
              decoration: InputDecoration(
                hintText: 'Input username',
              ),
            ),
            TextFormField(
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please Input Password';
                }
                return null;
              },
              maxLength: 16,
              maxLengthEnforced: true,
              controller: myPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Input Password',
              ),
            ),
            SizedBox(
              height: 25.0,
            ),
            MaterialButton(
              minWidth: 85.0,
              height: 50.0,
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () {
                //cek user aviez
                //cek pass < 5 g bisa login, > 5 bisa login

                // ngambil value dari widget textfield
                nUsername = myUsernameController.text;
                nPassword = myPasswordController.text;

                String user = "aviez";
                String pass = "123456";

                if (_formKey.currentState.validate()) {
                  if (nUsername == user && nPassword == pass) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  nama: nUsername,
                                  password: nPassword,
                                )));
                  } else if (nPassword.length <= 5) {
                    print("password harus lebih dari 5");
                  } else {
                    print('Username atau password anda salah');
                  }
                }
              },
              child: Text('Submit'),
            )
          ],
        ),
      ),
    );
  }
}
