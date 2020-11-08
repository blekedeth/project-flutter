import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:intl/intl.dart';

void main() => runApp(HitungUmur());

class HitungUmur extends StatefulWidget {
  @override
  _HitungUmurState createState() => _HitungUmurState();
}

class _HitungUmurState extends State<HitungUmur> {
  TextEditingController tgl = TextEditingController();
  TextEditingController bln = TextEditingController();
  TextEditingController thn = TextEditingController();
  int hitahun, hibulan, hitgl, tg, bl, tn;

  static var today = new DateTime.now();
  var formatedTanggal = new DateFormat.yMMMd().format(today);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hitung Umur"),
      ),
      body: Column(
        children: <Widget>[
          Container(
              child: Text(" Sekarang tanggal :" + formatedTanggal.toString())),
          Container(
              child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Tanggal"),
            controller: tgl,
          )),
          Container(
              child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Bulan"),
            controller: bln,
          )),
          Container(
              child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Tahun"),
            controller: thn,
          )),
          MaterialButton(
              color: Colors.lime,
              child: Text("Hitung"),
              onPressed: () {
                if (tgl.text.length == 0 ||
                    bln.text.length == 0 ||
                    thn.text.length == 0) {
                  Fluttertoast.showToast(
                      msg: "Field harus diisi dulu gan",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else if (tgl.text.length >= 3 ||
                    bln.text.length >= 3 ||
                    thn.text.length >= 5) {
                  Fluttertoast.showToast(
                      msg: "Field kelebihan angka gan",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.TOP,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0);
                } else {
                  tg = int.tryParse(tgl.text);
                  bl = int.tryParse(bln.text);
                  tn = int.tryParse(thn.text);
                  hitgl = today.day - tg;
                  hibulan = today.month - bl;
                  hitahun = today.year - tn;
                  showDialog(
                    context: context,
                    builder: (_) => FlareGiffyDialog(
                      flarePath: 'images/space_demo.flr',
                      flareAnimation: 'loading',
                      title: Text(
                        'Umur anda sekarang adalah',
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w500),
                      ),
                      description: Text(
                        hitahun.toString() +
                            " tahun, " +
                            hibulan.toString() +
                            " bulan, " +
                            hitgl.toString() +
                            " hari",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                  );
                }
              }),
        ],
      ),
    );
  }
}
