import 'package:flutter/material.dart';

import 'mainScreen.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: 'mainScreen',
    routes: {
      'mainScreen' : (context)=>MainScreen(),

    },
  ));
}

