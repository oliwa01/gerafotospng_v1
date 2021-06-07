import 'package:flutter/material.dart';

import 'geraData.dart';
import 'geraImage.dart';
import 'geraSigno.dart';
import 'geraTipoLua.dart';
import 'geraTipoLuz.dart';

class RepaintBounderyLua2 extends StatelessWidget {
  const RepaintBounderyLua2({
    Key? key,
    required this.luasize,
    required this.wc,
    required this.hc,
    required this.hcb,
    required int luadiadb1,
    required String hemisferio,
    required String nome1,
    required String dataPicket1,
    required double distancia1,
    required String signosdb1,
    required String proximodb1,
    required String timedb1,
    required String timenasc1,
  })  : _luadiadb1 = luadiadb1,
        _hemisferio = hemisferio,
        _nome1 = nome1,
        _dataPicket1 = dataPicket1,
        _distancia1 = distancia1,
        _signosdb1 = signosdb1,
        _proximodb1 = proximodb1,
        _timedb1 = timedb1,
        _timenasc1 = timenasc1,
        super(key: key);
  final int wc;
  final int hc;
  final int hcb;
  final int luasize;
  final int _luadiadb1;
  final String _hemisferio;
  final String _nome1;
  final String _dataPicket1;
  final double _distancia1;
  final String _signosdb1;
  final String _proximodb1;
  final String _timedb1;
  final String _timenasc1;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: wc.toDouble(),
      height: hc.toDouble(),
      color: Colors.black,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(width: wc.toDouble(), height: 30, color: Colors.black),
            //
            //tela pronta
            //
            Container(
                color: Colors.black,
                width: luasize.toDouble(),
                alignment: Alignment.topCenter,
                child: LimitedBox(
                    maxWidth: luasize.toDouble(),
                    maxHeight: luasize.toDouble(),
                    child: Container(
                      width: luasize.toDouble(),
                      height: luasize.toDouble(),
                      alignment: Alignment.topCenter,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.black,
                          image: DecorationImage(
                              image: new AssetImage(_luadiadb1.isNaN
                                  ? GeraImage().geraimage(00, 'sul')
                                  : GeraImage()
                                      .geraimage(_luadiadb1, _hemisferio)),
                              fit: BoxFit.contain)),
                    ))),
            Container(
                width: wc.toDouble(),
                color: Colors.black,
                height: hcb.toDouble(),
                child: Column(
                  children: <Widget>[
                    //
                    // NOME
                    //
                    SizedBox(height: 20),
                    Text(
                      _nome1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                    SizedBox(height: 6),
                    //
                    // DATA
                    //
                    Text(
                      GeraData().geradatas(_dataPicket1),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(height: 16),
                    //
                    // DISTANCIA
                    //

                    Text(
                      "Distancia :  " + _distancia1.toString() + " Kms",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                      ),
                    ),
                    SizedBox(height: 9),
                    //
                    // SIGNO
                    //
                    Text(
                      "Lua na Constelação de:",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(height: 15),
                    //
                    SizedBox(
                        width: 150,
                        height: 25,
                        child: Image(
                            image: AssetImage(GeraSigno().gerasigno(
                          _signosdb1,
                          _proximodb1,
                          _timedb1,
                          _timenasc1,
                        )))),
                    //
                    // TIPO DE LUA
                    //
                    Text(
                      GeraTipoLua().geraTipoLua(_luadiadb1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                    ),
                    //
                    // TIPO DE iluminação
                    //
                    SizedBox(height: 5),
                    Text(
                      GeraTipoLuz().geraTipoLuz(_luadiadb1),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                      ),
                    ),
                  ],
                  //
                ))
          ]),
    );
  }
}
