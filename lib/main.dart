import 'package:flutter/material.dart';
import 'Modal/burc_listesi.dart';

void main() => runApp(BurcApp());



class BurcApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Astolojicim',
      theme: ThemeData(
          primarySwatch: Colors.purple
      ),
      home: BurcListesi(),
    );
  }

}