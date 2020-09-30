import 'package:astrolojicim/Modal/burc.dart';
import 'package:astrolojicim/View/burc_listesi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BurcDetay extends StatelessWidget {
  int selectedIndex;
  Burc selectedBurc;

  BurcDetay(this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;
    selectedBurc = BurcListesi.listOfBurc[selectedIndex];

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: _sizeScreen.height / 4,
            pinned: true,
            primary: true,
            backgroundColor: Colors.purple,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(selectedBurc.burcName + " Burcu ve Özellikleri"),
              background: Image.asset(
                  'images/' + selectedBurc.burcLargePicture + '.png',
                  fit: BoxFit.cover),
              centerTitle: true,
            ),
          ),

          SliverToBoxAdapter(
            child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              margin: EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedBurc.burcDetail, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,),),
              ),
            ),
            ),
          ),
        ],
      ),
    );
  }
}
