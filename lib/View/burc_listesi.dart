import 'package:astrolojicim/Modal/burc.dart';
import 'package:astrolojicim/Utilities/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BurcListesi extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<Burc> listOfBurc = getAllBurc();
    final _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(title: Text("Burcunuzu Seçin")),
      body: buildListofBurc(listOfBurc,_screenSize),
    );
  }

  Widget buildListofBurc(List<Burc> listOfBurc, Size sreenSize) {
    sreenSize = sreenSize;
    return Container(
        child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) =>
                rowBurcBuilder(listOfBurc, index, sreenSize)));
  }

  Widget rowBurcBuilder(List<Burc> listOfBurc, int index, Size sreenSize) {
    sreenSize = sreenSize;
    return Container(
      height: sreenSize.height / 5,
      child: Card(

        elevation: 4,
        margin: EdgeInsets.all(sreenSize.height / 40),
        child: ListTile(

          title: Text(listOfBurc[index].burcName),
          leading: CircleAvatar(
            child: Image(
              image: AssetImage(
                  'images/' + listOfBurc[index].burcSmallPicture + '.png') ,fit: BoxFit.cover,
            ),

          ),
        ),
      ),
    );
  }

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
