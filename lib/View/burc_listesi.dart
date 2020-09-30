import 'package:astrolojicim/Modal/burc.dart';
import 'package:astrolojicim/Utilities/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {
  static List<Burc> listOfBurc;

  @override
  Widget build(BuildContext context) {
    listOfBurc = getAllBurc();
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Burcunuzu Seçin")),
      body: buildListofBurc(_screenSize),
    );
  }

  // Body of burcbuilder
  Widget buildListofBurc(Size sreenSize) {
    sreenSize = sreenSize;
    return Container(
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) =>
                rowBurcBuilder(index, sreenSize, context)));
  }

  // Row of burcbuilder func.
  Widget rowBurcBuilder(int index, Size sreenSize, BuildContext context) {
    sreenSize = sreenSize;
    return Container(
      alignment: Alignment.center,
      height: sreenSize.height / 5,
      child: Card(
        shadowColor: Colors.blue.shade900,
        elevation: 5,
        margin: EdgeInsets.all(sreenSize.height / 40),
        child: ListTile(
          onTap: ()=> Navigator.pushNamed(context, "/burcDetay/$index"),
          contentPadding: EdgeInsets.all(sreenSize.height / 35),
          title: Text(
            listOfBurc[index].burcName,
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 25,
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.w400),
          ),
          leading: Image.asset(
            'images/' + listOfBurc[index].burcSmallPicture + '.png',
            fit: BoxFit.fill,
            width: sreenSize.width / 5.5,
            height: sreenSize.height / 2,
          ),
          subtitle: Center(
            child: Text(
              listOfBurc[index].burcDate,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.blueGrey,
              ),
            ),
          ),
          trailing: Icon(Icons.arrow_forward_ios,size: 20,color: Colors.blue.shade700,),
        ),
      ),
    );
  }

  // Fetch all burc information from the Strings.dart file.
  List<Burc> getAllBurc() {
    List<Burc> myList = [];

    for (int i = 0; i < Strings.BURC_ADLARI.length; i++) {
      var burcs = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}",
          Strings.BURC_ADLARI[i].toLowerCase() + "_" + "buyuk" + "${i + 1}");

      myList.add(burcs);
    }
    return myList;
  }
}
