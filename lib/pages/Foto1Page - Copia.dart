import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'GeraFotos.dart';

class Foto1Pagexx extends StatefulWidget {
  String codvenda = "";
  String nome = "";
  String hemisferio = "";
  String email = "";
  String dataPicket1 = "";
  String nome1 = "";
  double distancia1 = 0.0;
  int luadiadb1 = 0;
  String proximodb1 = "";
  String signosdb1 = "";
  String timedb1 = "";
  String timenasc1 = "";

  Foto1Pagexx(
    this.nome,
    this.email,
    this.codvenda,
    this.dataPicket1,
    this.nome1,
    this.hemisferio,
    this.distancia1,
    this.luadiadb1,
    this.proximodb1,
    this.signosdb1,
    this.timenasc1,
    this.timedb1,
  );

  @override
  _Foto1PagexxState createState() => _Foto1PagexxState();
}

class _Foto1PagexxState extends State<Foto1Pagexx> {
  GlobalKey _containerKey = GlobalKey();
  FirebaseStorage storage = FirebaseStorage.instance;

  bool loading = false;

  String _dataPicket = " ";
  String _diadataPicket = "";
  String _mesdataPicket = "";
  String _anodataPicket = "";

  bool _mostraLayout = false;
  bool _mostraImagem = true;
  bool _nomealterado = false;
  bool _dataalterada = false;
  bool _diadataalterada = false;
  bool _mesdataalterada = false;
  bool _anodataalterada = false;
  bool _mostrabotaoimagem = false;

  //
  String _nome = "";
  String _launched = "";
  String _dataDb1 = "";
  String _datasLuaFind = "";
  String _timeDb1 = "";
  String _proximoDb1 = " ";
  String _signoDb1 = " ";
  String _hemisferio = " ";
  String _datanasc = " ";
  double _distanciaDb1 = 0;
  int _luadiaDb1 = 0;
  bool deu = true;
  //
  void convertWidgetToImage() async {
    /*
    RenderRepaintBoundary renderRepaintBoundary =
        _containerKey.currentContext.findRenderObject();
    ui.Image boxImage = await renderRepaintBoundary.toImage(pixelRatio: 1.477);
    ByteData? byteData =
        await boxImage.toByteData(format: ui.ImageByteFormat.png);
    Uint8List uInt8List = byteData!.buffer.asUint8List();
    this.setState(() {
      loading = true;
    });
    Reference ref = FirebaseStorage.instance
        .ref()
        .child("Lua_01_${widget.nome1}${DateTime.now().millisecond}.png");
    await ref.putData(uInt8List).whenComplete(() {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => GeraFotos(widget.nome, widget.email)));
    });

     */
  }

  _salvaDados(String datadb, String signodb, String timedb, String proximodb,
      int luadiadb, double distanciadb, String hemisferio, String datanasc) {
    setState(() {
      _nome = widget.nome1;
      _dataDb1 = datadb;
      _signoDb1 = signodb;
      _timeDb1 = timedb;
      _distanciaDb1 = distanciadb;
      _luadiaDb1 = luadiadb;
      _proximoDb1 = proximodb;
      _hemisferio = hemisferio;
      _datanasc = datanasc;
    });
  }

  void initState() {
    _salvaDados(
        widget.dataPicket1,
        widget.signosdb1,
        widget.timedb1,
        widget.proximodb1,
        widget.luadiadb1,
        widget.distancia1,
        widget.hemisferio,
        widget.timenasc1);

    super.initState();
  }
  //

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;

    //
    bool portrait = (widthlua > 600 ? false : true);
    double nomeluasize = 40;
    double datasize = 30;
    double tipoluasize = 38;
    double distanciasize = 20;
    double signowsize = 400;
    double signohsize = 100;
    double tipoluzsize = 15;

    _dataalterada = ((_diadataalterada == true) &&
            (_mesdataalterada == true) &&
            (_anodataalterada == true))
        ? true
        : false;
    _dataPicket = ("$_anodataPicket$_mesdataPicket$_diadataPicket");

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
//botoes tela magem
//
                              Container(
                                  width: 2400,
                                  height: 200,
                                  alignment: Alignment.bottomRight,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        SizedBox(
                                            height: 60,
                                            child: MaterialButton(
                                              color: Colors.deepOrange,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.0))),
                                              onPressed: () {
                                                Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            GeraFotos(
                                                                widget.nome,
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
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              20.0))),
                                              onPressed: () {
                                                convertWidgetToImage();
                                              },
                                              child: const Text(
                                                'Comprar esta foto',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ))
                                      ])),

//
// INPUT DADOS NOME DATA
//
                            ]))))));
  }
}
