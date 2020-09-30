import 'package:astrolojicim/View/burc_detay.dart';
import 'package:flutter/material.dart';

import 'View/burc_listesi.dart';

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

      initialRoute: "/burcListesi",
      routes: {
        "/" : (context) => BurcListesi(),
        "/burcListesi" : (context) => BurcListesi()
      },

      onGenerateRoute: (RouteSettings settings) {
        List<String> pathName = settings.name.split("/");
        if (pathName[1] == "burcDetay"){
          return MaterialPageRoute(builder: (context) => BurcDetay(int.parse(pathName[2])));
        }
        return null;
      },

    );
  }

}