import 'dart:typed_data' show ByteData, Uint8List;
import 'dart:ui' as ui;

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '/classes/repaintBounderyLua.dart';
import 'GeraFotos.dart';

class PageFoto4 extends StatefulWidget {
  final String codVenda;
  final String dataPicket1;
  final String dataPicket2;
  final String dataPicket3;
  final String dataPicket4;
  final String dataPicket5;
  final String dataPicket6;
  final double distanciadb1;
  final double distanciadb2;
  final double distanciadb3;
  final double distanciadb4;
  final double distanciadb5;
  final double distanciadb6;
  final String email;
  final String hemisferio;
  final String hemisferio2;
  final String hemisferio3;
  final String hemisferio4;
  final String hemisferio5;
  final String hemisferio6;
  final int luadiadb1;
  final int luadiadb2;
  final int luadiadb3;
  final int luadiadb4;
  final int luadiadb5;
  final int luadiadb6;
  final String nome1;
  final String nome2;
  final String nome3;
  final String nome4;
  final String nome5;
  final String nome6;
  final String nomefamilia;
  final int numberPicture;
  final String proximodb;
  final String proximodb2;
  final String proximodb3;
  final String proximodb4;
  final String proximodb5;
  final String proximodb6;
  final String signo1;
  final String signo2;
  final String signo3;
  final String signo4;
  final String signo5;
  final String signo6;
  final String timedb1;
  final String timedb2;
  final String timedb3;
  final String timedb4;
  final String timedb5;
  final String timedb6;
  final String timenasc1;
  final String timenasc2;
  final String timenasc3;
  final String timenasc4;
  final String timenasc5;
  final String timenasc6;

  PageFoto4(
      {this.codVenda = '0',
      this.dataPicket1 = '',
      this.dataPicket2 = '',
      this.dataPicket3 = '',
      this.dataPicket4 = '',
      this.dataPicket5 = '',
      this.dataPicket6 = '',
      this.distanciadb1 = 0,
      this.distanciadb2 = 0,
      this.distanciadb3 = 0,
      this.distanciadb4 = 0,
      this.distanciadb5 = 0,
      this.distanciadb6 = 0,
      this.email = '',
      this.hemisferio = '',
      this.hemisferio2 = '',
      this.hemisferio3 = '',
      this.hemisferio4 = '',
      this.hemisferio5 = '',
      this.hemisferio6 = '',
      this.luadiadb1 = 0,
      this.luadiadb2 = 0,
      this.luadiadb3 = 0,
      this.luadiadb4 = 0,
      this.luadiadb5 = 0,
      this.luadiadb6 = 0,
      this.nome1 = '',
      this.nome2 = '',
      this.nome3 = '',
      this.nome4 = '',
      this.nome5 = '',
      this.nome6 = '',
      this.nomefamilia = '',
      this.numberPicture = 0,
      this.proximodb = '',
      this.proximodb2 = '',
      this.proximodb3 = '',
      this.proximodb4 = '',
      this.proximodb5 = '',
      this.proximodb6 = '',
      this.signo1 = '',
      this.signo2 = '',
      this.signo3 = '',
      this.signo4 = '',
      this.signo5 = '',
      this.signo6 = '',
      this.timedb1 = '',
      this.timedb2 = '',
      this.timedb3 = '',
      this.timedb4 = '',
      this.timedb5 = '',
      this.timedb6 = '',
      this.timenasc1 = '',
      this.timenasc2 = '',
      this.timenasc3 = '',
      this.timenasc4 = '',
      this.timenasc5 = '',
      this.timenasc6 = ''});
  @override
  _PageFoto4State createState() => _PageFoto4State();
}

class _PageFoto4State extends State<PageFoto4> {
  GlobalKey _containerKey = GlobalKey();
  bool deu = true;
  String _email = '';
  int _numberPictures = 0;
  String _dataPicket1 = '';
  String _nome1 = '';
  double _distancia1 = 0.0;
  int _luadiadb1 = 0;
  String _proximodb = '';
  String _signosdb1 = '';
  String _timedb1 = '';
  String _timenasc1 = '';
  String _hemisferio = '';
  String _dataPicket2 = '';
  String _nome2 = '';
  double _distancia2 = 0.0;
  int _luadiadb2 = 0;
  String _proximodb2 = '';
  String _signosdb2 = '';
  String _timedb2 = '';
  String _timenasc2 = '';
  String _hemisferio2 = '';
  String _dataPicket3 = '';
  String _nome3 = '';
  double _distancia3 = 0.0;
  int _luadiadb3 = 0;
  String _proximodb3 = '';
  String _signosdb3 = '';
  String _timedb3 = '';
  String _timenasc3 = '';
  String _hemisferio3 = '';
  String _dataPicket4 = '';
  String _nome4 = '';
  double _distancia4 = 0.0;
  int _luadiadb4 = 0;
  String _proximodb4 = '';
  String _signosdb4 = '';
  String _timedb4 = '';
  String _timenasc4 = '';
  String _hemisferio4 = '';
  //
  bool loading = false;

  _gravaDados() {
    _email = widget.email;
    _numberPictures = widget.numberPicture;
    _dataPicket1 = widget.dataPicket1;
    _nome1 = widget.nome1;
    _distancia1 = widget.distanciadb1;
    _luadiadb1 = widget.luadiadb1;
    _proximodb = widget.proximodb;
    _signosdb1 = widget.signo1;
    _timedb1 = widget.timedb1;
    _timenasc1 = widget.timenasc1;
    _hemisferio = widget.hemisferio;

    _dataPicket2 = widget.dataPicket2;
    _nome2 = widget.nome2;
    _distancia2 = widget.distanciadb2;
    _luadiadb2 = widget.luadiadb2;
    _proximodb2 = widget.proximodb2;
    _signosdb2 = widget.signo2;
    _timedb2 = widget.timedb2;
    _timenasc2 = widget.timenasc2;
    _hemisferio2 = widget.hemisferio2;

    _dataPicket3 = widget.dataPicket3;
    _nome3 = widget.nome3;
    _distancia3 = widget.distanciadb3;
    _luadiadb3 = widget.luadiadb3;
    _proximodb3 = widget.proximodb3;
    _signosdb3 = widget.signo3;
    _timedb3 = widget.timedb3;
    _timenasc3 = widget.timenasc3;
    _hemisferio3 = widget.hemisferio3;

    _dataPicket4 = widget.dataPicket4;
    _nome4 = widget.nome4;
    _distancia4 = widget.distanciadb4;
    _luadiadb4 = widget.luadiadb4;
    _proximodb4 = widget.proximodb4;
    _signosdb4 = widget.signo4;
    _timedb4 = widget.timedb4;
    _timenasc4 = widget.timenasc4;
    _hemisferio4 = widget.hemisferio4;
  }

  //

  @override
  void initState() {
    super.initState();
    _gravaDados();
  }

  @override
  Widget build(BuildContext context) {
    int luasize = 1900;

    RepaintBounderyLua repaintBounderyLua1 = RepaintBounderyLua(
        wc: 2398,
        hc: 3000,
        hcb: 340,
        luasize: luasize,
        luadiadb1: _luadiadb1,
        hemisferio: _hemisferio,
        nome1: _nome1,
        dataPicket1: _dataPicket1,
        distancia1: _distancia1,
        signosdb1: _signosdb1,
        proximodb1: _proximodb,
        timedb1: _timedb1,
        timenasc1: _timenasc1);
    RepaintBounderyLua repaintBounderyLua2 = RepaintBounderyLua(
        wc: 2398,
        hc: 3000,
        hcb: 340,
        luasize: luasize,
        luadiadb1: _luadiadb2,
        hemisferio: _hemisferio2,
        nome1: _nome2,
        dataPicket1: _dataPicket2,
        distancia1: _distancia2,
        signosdb1: _signosdb2,
        proximodb1: _proximodb2,
        timedb1: _timedb2,
        timenasc1: _timenasc2);

    RepaintBounderyLua repaintBounderyLua3 = RepaintBounderyLua(
        wc: 2398,
        hc: 3000,
        hcb: 340,
        luasize: luasize,
        luadiadb1: _luadiadb3,
        hemisferio: _hemisferio3,
        nome1: _nome3,
        dataPicket1: _dataPicket3,
        distancia1: _distancia3,
        signosdb1: _signosdb3,
        proximodb1: _proximodb3,
        timedb1: _timedb3,
        timenasc1: _timenasc3);

    RepaintBounderyLua repaintBounderyLua4 = RepaintBounderyLua(
        wc: 2398,
        hc: 3000,
        hcb: 340,
        luasize: luasize,
        luadiadb1: _luadiadb4,
        hemisferio: _hemisferio4,
        nome1: _nome4,
        dataPicket1: _dataPicket4,
        distancia1: _distancia4,
        signosdb1: _signosdb4,
        proximodb1: _proximodb4,
        timedb1: _timedb4,
        timenasc1: _timenasc4);

    //RenderObject? rb = _containerKey.currentContext!.findRenderObject();

    void convertWidgetToImage() async {
      final RenderRepaintBoundary boundary = _containerKey.currentContext!
          .findRenderObject()! as RenderRepaintBoundary;
      RenderRepaintBoundary renderRepaintBoundary =
          //  _containerKey.currentContext!.findRenderObject();
          boundary;
      ui.Image boxImage =
          await renderRepaintBoundary.toImage(pixelRatio: 1.477);
      ByteData? byteData =
          await boxImage.toByteData(format: ui.ImageByteFormat.png);
      Uint8List uInt8List = byteData!.buffer.asUint8List();
      this.setState(() {
        loading = true;
      });
      Reference ref = FirebaseStorage.instance.ref().child(
          "Lua_04_${widget.nomefamilia}${DateTime.now().millisecond}.png");
      await ref.putData(uInt8List).whenComplete(() {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => GeraFotos('', widget.email)));
      });
    }

    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            child: Align(
                alignment: Alignment.topCenter,
                child: SingleChildScrollView(
                    // horizontal scroll widget
                    scrollDirection: Axis.horizontal,
                    child: SingleChildScrollView(
                        // vertical scroll widget
                        scrollDirection: Axis.vertical,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              //
                              Container(
                                width: 10000,
                                height: 200,
                                alignment: Alignment.bottomRight,
                                child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(
                                          height: 60,
                                          child: MaterialButton(
                                            color: Colors.deepOrange,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            onPressed: () {
                                              Navigator.pushReplacement(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          GeraFotos('',
                                                              widget.email)));
                                            },
                                            child: Text(
                                              "Voltar",
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          )),
                                      SizedBox(width: 40),
                                      SizedBox(
                                          height: 60,
                                          child: MaterialButton(
                                            color: deu
                                                ? Colors.deepOrange
                                                : Colors.green,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(20.0))),
                                            onPressed: () {
                                              convertWidgetToImage();
                                            },
                                            child: const Text(
                                              'Comprar esta foto',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ))
                                    ]),
                              ),
                              RepaintBoundary(
                                  key: _containerKey,
                                  child: Container(
                                    width: 10000,
                                    height: 3324,
                                    color: Colors.black,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  repaintBounderyLua1,
                                                ]),
                                            Container(width: 100),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  repaintBounderyLua2,
                                                ]),
                                            Container(width: 100),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  repaintBounderyLua3,
                                                ]),
                                            Container(width: 100),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: <Widget>[
                                                  repaintBounderyLua4,
                                                ]),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              'FAMÍLIA ${widget.nomefamilia.toUpperCase()}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 150,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 20)
                                      ],
                                    ),
                                  ))
                            ]))))));
  }
}
