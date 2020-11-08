import 'package:flutter/material.dart';

class PageColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widget Column'),
      ),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text('Hello 1'),
            color: Colors.lime,
            padding: EdgeInsets.all(16.0),
          ),

          Container(
            child: Text('Hello 2'),
            color: Colors.purple,
            padding: EdgeInsets.all(16.0),
          ),

          Container(
            child: Text('Hello 3'),
            color: Colors.green,
            padding: EdgeInsets.all(16.0),
          )
        ],
      ),
    );
  }
}
