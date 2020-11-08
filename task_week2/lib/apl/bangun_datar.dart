import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class BangunDatar extends StatefulWidget {
  @override
  _VolumeState createState() => _VolumeState();
}

class _VolumeState extends State<BangunDatar> {
  TextEditingController sisi = TextEditingController();
  TextEditingController panjang = TextEditingController();
  TextEditingController lebar = TextEditingController();
  TextEditingController sisia = TextEditingController();
  TextEditingController sisib = TextEditingController();
  TextEditingController sisic = TextEditingController();
  TextEditingController sisid = TextEditingController();
  TextEditingController sisit = TextEditingController();
  TextEditingController asgt = TextEditingController();
  TextEditingController bsgt = TextEditingController();
  TextEditingController csgt = TextEditingController();
  TextEditingController tsgt = TextEditingController();
  int si, pjg, lbr, sia, sib, sic, sid, sit, kel, luas, asg, bs, cs, ts;
  double lusg;
  TabBar mytab = TabBar(
      indicatorColor: Colors.red,
      labelColor: Colors.amberAccent,
      tabs: <Widget>[
        Tab(
          text: "Persegi",
        ),
        Tab(
          text: "P. Panjang",
        ),
        Tab(
          text: "Jajar G",
        ),
        Tab(
          text: "Segitiga",
        )
      ]);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Hitung Bangun Datar"),
            backgroundColor: Colors.blueAccent,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(mytab.preferredSize.height),
              child: Container(
                child: mytab,
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Container(
                child: ListView(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 50),
                      child: Column(
                        children: [
                          Image(
                              width: 150,
                              image: AssetImage('images/persegi.png')),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.green)),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.black, width: 2)),
                                labelText: "Sisi"),
                            controller: sisi,
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 40),
                            child: RaisedButton(
                              color: Colors.blue[700],
                              onPressed: () {
                                if (sisi.text.length == 0) {
                                  Fluttertoast.showToast(
                                      msg: "Field g Boleh Kosong gan",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.TOP,
                                      backgroundColor: Colors.yellow,
                                      textColor: Colors.red,
                                      fontSize: 16.0);
                                } else {
                                  si = int.tryParse(sisi.text);
                                  kel = 4 * si;
                                  luas = si * si;
                                  showDialog(
                                      context: context,
                                      builder: (_) => FlareGiffyDialog(
                                            flarePath: 'images/space_demo.flr',
                                            flareAnimation: 'loading',
                                            title: Text(
                                              'Keliling dan Luas Persegi',
                                              style: TextStyle(
                                                  fontSize: 22.0,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            description: Text(
                                              "Keliling : " +
                                                  kel.toString() +
                                                  "\n Luas : " +
                                                  luas.toString(),
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            entryAnimation:
                                                EntryAnimation.DEFAULT,
                                            onOkButtonPressed: () {},
                                          ));
                                }
                              },
                              child: Text("Luas dan Keliling"),
                              textColor: Colors.white,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image(
                                width: 150,
                                image: AssetImage('images/ppanjang.png')),
                            Text(
                                "Silahkan Masukkan Ukuran Panjang dan Lebarnya"),
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 20, 40, 5),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2)),
                                          labelText: "Panjang"),
                                      controller: panjang,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 2)),
                                        labelText: "Lebar"),
                                    controller: lebar,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 40),
                                    child: RaisedButton(
                                      color: Colors.blue[700],
                                      onPressed: () {
                                        if (panjang.text.length == 0 ||
                                            lebar.text.length == 0) {
                                          Fluttertoast.showToast(
                                              msg: "Field g Boleh Kosong gan",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.TOP,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        } else {
                                          pjg = int.tryParse(panjang.text);
                                          lbr = int.tryParse(lebar.text);
                                          kel = (2 * pjg) + (2 * lbr);
                                          luas = pjg * lbr;
                                          showDialog(
                                              context: context,
                                              builder: (_) => FlareGiffyDialog(
                                                    flarePath:
                                                        'images/space_demo.flr',
                                                    flareAnimation: 'loading',
                                                    title: Text(
                                                      "Keliling dan Luas Persegi Panjang",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    description: Text(
                                                      "Keliling : " +
                                                          kel.toString() +
                                                          "\n Luas : " +
                                                          luas.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    entryAnimation:
                                                        EntryAnimation.DEFAULT,
                                                    onOkButtonPressed: () {},
                                                  ));
                                        }
                                      },
                                      child: Text("Cari Luas dan Keliling"),
                                      textColor: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              Image(
                                  width: 100,
                                  image: AssetImage('images/jgenjang.png')),
                              Text("Masukkan Ukuran sisi dari jajaran genjang"),
                              Container(
                                margin: EdgeInsets.fromLTRB(40, 20, 40, 5),
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blueAccent)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2)),
                                            labelText: "Sisi a"),
                                        controller: sisia,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                          keyboardType: TextInputType.number,
                                          decoration: InputDecoration(
                                              focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Colors.blueAccent)),
                                              enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.blue,
                                                      width: 2)),
                                              labelText: "Sisi b"),
                                          controller: sisib),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blueAccent)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2)),
                                            labelText: "sisi c"),
                                        controller: sisic,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(bottom: 20),
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                            focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blueAccent)),
                                            enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue,
                                                    width: 2)),
                                            labelText: "sisi d"),
                                        controller: sisid,
                                      ),
                                    ),
                                    TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2)),
                                          labelText: "Tinggi"),
                                      controller: sisit,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 40),
                                      child: RaisedButton(
                                        color: Colors.blue[700],
                                        onPressed: () {
                                          if (sisia.text.length == 0 ||
                                              sisib.text.length == 0 ||
                                              sisic.text.length == 0 ||
                                              sisid.text.length == 0 ||
                                              sisit.text.length == 0) {
                                            Fluttertoast.showToast(
                                                msg: "Field g Boleh Kosong gan",
                                                toastLength: Toast.LENGTH_SHORT,
                                                gravity: ToastGravity.TOP,
                                                backgroundColor: Colors.red,
                                                textColor: Colors.white,
                                                fontSize: 16.0);
                                          } else {
                                            sia = int.tryParse(sisia.text);
                                            sib = int.tryParse(sisib.text);
                                            sic = int.tryParse(sisic.text);
                                            sid = int.tryParse(sisid.text);
                                            sit = int.tryParse(sisit.text);
                                            kel = sia + sib + sic + sid;
                                            luas = sia * sit;
                                            showDialog(
                                                context: context,
                                                builder: (_) =>
                                                    FlareGiffyDialog(
                                                      flarePath:
                                                          'images/space_demo.flr',
                                                      flareAnimation: 'loading',
                                                      title: Text(
                                                        "Keliling dan Luas Jajar Genjang",
                                                        style: TextStyle(
                                                            fontSize: 15.0,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                      description: Text(
                                                        "Keliling : " +
                                                            kel.toString() +
                                                            "\n Luas : " +
                                                            luas.toString(),
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w500),
                                                      ),
                                                      entryAnimation:
                                                          EntryAnimation
                                                              .DEFAULT,
                                                      onOkButtonPressed: () {},
                                                    ));
                                          }
                                        },
                                        child: Text("Cari Luas Dan Keliling"),
                                        textColor: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ),
              Container(
                child: Center(
                  child: ListView(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          children: [
                            Image(
                                width: 150,
                                image: AssetImage('images/segitiga.png')),
                            Text(
                                "Silahkan Masukan Ukuran tiap sisi Segitiga !"),
                            Container(
                              margin: EdgeInsets.fromLTRB(40, 20, 40, 5),
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2)),
                                          labelText: "sisi a"),
                                      controller: asgt,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2)),
                                          labelText: "sisi d"),
                                      controller: bsgt,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(bottom: 20),
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                          focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blueAccent)),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue,
                                                  width: 2)),
                                          labelText: "sisi c"),
                                      controller: csgt,
                                    ),
                                  ),
                                  TextField(
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blueAccent)),
                                        enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue, width: 2)),
                                        labelText: "Tinggi"),
                                    controller: tsgt,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 40),
                                    child: RaisedButton(
                                      color: Colors.blue[700],
                                      onPressed: () {
                                        if (asgt.text.length == 0 ||
                                            bsgt.text.length == 0 ||
                                            csgt.text.length == 0 ||
                                            tsgt.text.length == 0) {
                                          Fluttertoast.showToast(
                                              msg: "Field g Boleh Kosong gan",
                                              toastLength: Toast.LENGTH_SHORT,
                                              gravity: ToastGravity.TOP,
                                              backgroundColor: Colors.red,
                                              textColor: Colors.white,
                                              fontSize: 16.0);
                                        } else {
                                          asg = int.tryParse(asgt.text);
                                          bs = int.tryParse(bsgt.text);
                                          cs = int.tryParse(csgt.text);
                                          ts = int.tryParse(tsgt.text);
                                          kel = asg + bs + cs;
                                          lusg = 1 / 2 * (asg * ts);
                                          showDialog(
                                              context: context,
                                              builder: (_) => FlareGiffyDialog(
                                                    flarePath:
                                                        'images/space_demo.flr',
                                                    flareAnimation: 'loading',
                                                    title: Text(
                                                      "Keliling dan Luas Segitiga",
                                                      style: TextStyle(
                                                          fontSize: 15.0,
                                                          fontWeight:
                                                              FontWeight.w600),
                                                    ),
                                                    description: Text(
                                                      "Keliling : " +
                                                          kel.toString() +
                                                          "\n Luas : " +
                                                          lusg.toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    entryAnimation:
                                                        EntryAnimation.DEFAULT,
                                                    onOkButtonPressed: () {},
                                                  ));
                                        }
                                      },
                                      child: Text("Cari Luas Dan Keliling"),
                                      textColor: Colors.white,
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
