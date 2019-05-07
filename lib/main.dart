import 'package:flutter/material.dart';
import './ui/home.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Pomo25",
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Iceberg'),
      home: Home(),
    ));
