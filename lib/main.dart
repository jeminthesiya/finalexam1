import 'dart:js_util';

import 'package:finalexam1/add.dart';
import 'package:finalexam1/first.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Add(),
        'add': (context) => First(),

      },
    ),
  );
}
