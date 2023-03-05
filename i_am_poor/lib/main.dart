import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('i_am_poor'),
      ),
      body: Center(
        child: Image(
          image: AssetImage('images/2.jpg'),
        ),
      ),
    ),
  ));
}
