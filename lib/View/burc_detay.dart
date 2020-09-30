import 'package:astrolojicim/Modal/burc.dart';
import 'package:astrolojicim/View/burc_listesi.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  int selectedIndex;

  BurcDetay(this.selectedIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc selectedBurc;
  Color appBarColor;
  PaletteGenerator paletteGenerator;

  @override
  void initState() {
    super.initState();
    selectedBurc = BurcListesi.listOfBurc[widget.selectedIndex];
    colorGenerateFromImage();
  }

  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size;

    return Scaffold(
      body: CustomScrollView(
        primary: false,
        slivers: [
          SliverAppBar(
            expandedHeight: _sizeScreen.height / 4,
            pinned: true,
            primary: true,
            backgroundColor:
                appBarColor != null ? appBarColor : Colors.blueGrey.shade400,
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
                  child: Text(
                    selectedBurc.burcDetail,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Palette Generator fetch color from the AssetImage
  void colorGenerateFromImage() {
    Future<PaletteGenerator> colorGenerator =
        PaletteGenerator.fromImageProvider(
            AssetImage("images/" + selectedBurc.burcLargePicture + ".png"));
    colorGenerator.then((value) {
      paletteGenerator = value;
      setState(() {
        appBarColor = paletteGenerator.dominantColor.color;
      });
    });
  }
}
