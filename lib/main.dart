import 'package:flutter/material.dart';
import 'package:knowledgetest_app/soru.dart';
import 'package:knowledgetest_app/test_veri.dart';

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



  TestVeri testVeri_1=TestVeri();

  SorulariKontrolEt(bool dogrumu) {

    setState(() {
        if (dogrumu==testVeri_1.getSoruYaniti()) {
          secimler.add(kDogruIconu);
        } else {
          secimler.add(kYanlisIconu);
        }
        testVeri_1.sonrakiSoru();
      });

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
                testVeri_1.getSoruMetni(),
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
                        SorulariKontrolEt(false);
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
                        SorulariKontrolEt(true);
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
