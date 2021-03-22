import 'package:flutter/material.dart';

import 'constants.dart';

void main() => runApp(BilgiTesti());

class BilgiTesti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[700],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: SoruSayfasi(),
          ),
        ),
      ),
    );
  }
}

class SoruSayfasi extends StatefulWidget {
  @override
  _SoruSayfasiState createState() => _SoruSayfasiState();
}

class _SoruSayfasiState extends State<SoruSayfasi> {
  List<Widget> secimler = [];
  List<String> sorular = [
    "Titanic gelmiş geçmiş en büyük gemidir",
    "Dünyadaki tavuk sayısı insan sayısından fazladır",
    "Türkiyenin başkentş adanadır",
    "Adana ülkedir",
    "Adanalılar adamdır",
    "Kelebeklerin ömrü bir gündür",
    "Dünya düzdür",
    "Fatih Sultan Mehmet hiç patates yememiştir",
    "Fransızlar 80 demek için, 4 - 20 der"
  ];
  int soruDegis=0;
  String dogrumu;
  List<String> yanitlar=["false","true","false","false","true","false","false","true","true"];

  SorulariKontrolEt(String dogrumu){
    if(soruDegis<8){
      soruDegis=soruDegis+1;


    this.dogrumu=dogrumu;
    setState(() {
      if(dogrumu==yanitlar[soruDegis-1])
      {
        secimler.add(kDogruIconu);
      }
      else {
        secimler.add(kYanlisIconu);
      }
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                '${sorular[soruDegis]}',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Wrap(
          spacing: 3,
          runSpacing: 3,
          direction: Axis.horizontal,
          children: secimler,
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: Row(children: <Widget>[
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: RaisedButton(
                    padding: EdgeInsets.all(12),
                    textColor: Colors.white,
                    color: Colors.red[400],
                    child: Icon(
                      Icons.thumb_down,
                      size: 30.0,
                    ),
                    onPressed: () {
                      SorulariKontrolEt("false");
                    },
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 6),
                  child: RaisedButton(
                    padding: EdgeInsets.all(12),
                    textColor: Colors.white,
                    color: Colors.green[400],
                    child: Icon(Icons.thumb_up, size: 30.0),
                    onPressed: () {
                      SorulariKontrolEt("true");
                    },
                  ),
                ),
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
