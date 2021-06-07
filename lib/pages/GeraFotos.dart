import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Home.dart';
import 'pageFoto1.dart';
import 'pageFoto2.dart';
import 'pageFoto3.dart';
import 'pageFoto4.dart';
import 'pageFoto5.dart';
import 'pageFoto6.dart';

class GeraFotos extends StatefulWidget {
  String nome;
  String email;
  GeraFotos(this.nome, this.email);
  @override
  _GeraFotosState createState() => _GeraFotosState();
}

class _GeraFotosState extends State<GeraFotos> {
  _authuser() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: "walter@wop.com.br", password: "123456");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
      print('++++++++++++USUARIO OK+++++++++++++++++++++');
    }
  }

  @override
  void initState() {
    //   _authuser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        color: Colors.deepOrange,
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 1,
            child: Scaffold(
                appBar: AppBar(
                  centerTitle: true,
                  title: Text("No Mundo das Luas - Fotos Geradas"),
                  leading: GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Home()));
                      },
                      child: Icon(
                        Icons.arrow_back, size: 30, // add custom icons also
                      )),
                  flexibleSpace: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: <Color>[
                          Color(0xFF000000),
                          Color(0XFF000000),
                        ])),
                  ),
                  bottom: TabBar(
                    indicatorColor: Colors.white,
                    indicatorSize: TabBarIndicatorSize.tab,
                    tabs: [
                      Tab(
                          icon: Icon(Icons.show_chart,
                              color: Colors.white, size: 40.0)),
                    ],
                  ),
                ),
                body: TabBarView(children: [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListPage(widget.nome, widget.email),
                  )
                ]))));

    //
    //
  }
}

class ListPage extends StatefulWidget {
  String nome;
  String email;
  ListPage(this.nome, this.email);
  @override
  _ListPageState createState() => _ListPageState();
}

//
//
//
class _ListPageState extends State<ListPage> {
  String _hemisferio = "";
  String _hemisferio2 = "";
  String _hemisferio3 = "";
  String _hemisferio4 = "";
  String _hemisferio5 = "";
  String _hemisferio6 = "";
  //
  String _timenasc1 = "";
  String _timenasc2 = "";
  String _timenasc3 = "";
  String _timenasc4 = "";
  String _timenasc5 = "";
  String _timenasc6 = "";

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance
        .collection('usuarios')
        .doc(widget.email)
        .collection('fotos');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            return new ListTile(
              title: (document['numberPicture'] == 1)
                  ? Text(
                      " Codigo : " +
                          (document['codVenda']) +
                          " -  Nome Foto : " +
                          (document['nome1']),
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))
                  : (document['numberPicture'] == 2)
                      ? Text(
                          " Codigo : " +
                              (document['codVenda']) +
                              " -  Nome Família : " +
                              (document['nomefamilia']) +
                              " -  Nome Foto-1 : " +
                              (document['nome1']) +
                              " -  Nome Foto-2 : " +
                              (document['nome2']),
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold))
                      : (document['numberPicture'] == 3)
                          ? Text(
                              " Codigo : " +
                                  (document['codVenda']) +
                                  " -  Nome Família : " +
                                  (document['nomefamilia']) +
                                  " -  Nome Foto-1 : " +
                                  (document['nome1']) +
                                  " -  Nome Foto-2 : " +
                                  (document['nome2']) +
                                  " -  Nome Foto-3 : " +
                                  (document['nome3']),
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold))
                          : (document['numberPicture'] == 4)
                              ? Text(
                                  " Codigo : " +
                                      (document['codVenda']) +
                                      " -  Nome Família : " +
                                      (document['nomefamilia']) +
                                      " -  Nome Foto-1 : " +
                                      (document['nome1']) +
                                      " -  Nome Foto-2 : " +
                                      (document['nome2']) +
                                      " -  Nome Foto-3 : " +
                                      (document['nome3']) +
                                      " - Nome Foto-4 : " +
                                      (document['nome4']),
                                  style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.deepOrange,
                                      fontWeight: FontWeight.bold))
                              : (document['numberPicture'] == 5)
                                  ? Text(
                                      " Codigo : " +
                                          (document['codVenda']) +
                                          " -  Nome Família : " +
                                          (document['nomefamilia']) +
                                          " -  Nome Foto-1 : " +
                                          (document['nome1']) +
                                          " -  Nome Foto-2 : " +
                                          (document['nome2']) +
                                          " -  Nome Foto-3 : " +
                                          (document['nome3']) +
                                          " -  Nome Foto-4 : " +
                                          (document['nome4']) +
                                          " Nome Foto-5 : " +
                                          (document['nome5']),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold))
                                  : Text(
                                      " Codigo : " +
                                          (document['codVenda']) +
                                          " -  Nome Família : " +
                                          (document['nomefamilia']) +
                                          " -  Nome Foto-1 : " +
                                          (document['nome1']) +
                                          " -  Nome Foto-2 : " +
                                          (document['nome2']) +
                                          " -  Nome Foto-3 : " +
                                          (document['nome3']) +
                                          " - Nome Foto-4 : " +
                                          (document['nome4']) +
                                          " - Nome Foto-5 : " +
                                          (document['nome5']) +
                                          " - Nome Foto-6 : " +
                                          (document['nome6']),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.cyan,
                                          fontWeight: FontWeight.bold)),
              subtitle: new Text(document.id +
                  "\n-----------------------------------------------------"),
              onTap: () {
                if (document["numberPicture"] == 1) {
                  if (document["hemisferio"] == null) {
                    _hemisferio = "sul";
                  } else {
                    _hemisferio = document["hemisferio"];
                  }
                  //
                  if (document["timenasc1"] == null) {
                    _timenasc1 = "9999";
                  } else {
                    _timenasc1 = document["timenasc1"];
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageFoto1(
                                email: widget.email,
                                codVenda: (document["codVenda"]),
                                nomefamilia: '',
                                numberPicture: 1,
                                dataPicket1: (document["dataPicket1"]),
                                nome1: (document["nome1"]),
                                distanciadb1:
                                    (document["distanciadb1"]).roundToDouble(),
                                luadiadb1: (document["luadiadb1"]),
                                proximodb: (document["proximodb"]),
                                signo1: (document["signo1"]),
                                timedb1: (document["timedb1"]),
                                timenasc1: (document["timenasc1"]),
                                hemisferio: (document["hemisferio"]),
                              )));
                } else if (document["numberPicture"] == 2) {
                  if (document["hemisferio"] == null) {
                    _hemisferio = "sul";
                  } else {
                    _hemisferio = document["hemisferio"];
                  }
                  //
                  if (document["hemisferio2"] == null) {
                    _hemisferio2 = "sul";
                  } else {
                    _hemisferio2 = document["hemisferio2"];
                  }
                  //
                  if (document["timenasc1"] == null) {
                    _timenasc1 = "9999";
                  } else {
                    _timenasc1 = document["timenasc1"];
                  }
                  if (document["timenasc2"] == null) {
                    _timenasc2 = "9999";
                  } else {
                    _timenasc2 = document["timenasc2"];
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageFoto2(
                                email: widget.email,
                                codVenda: (document["codVenda"]),
                                nomefamilia: (document["nomefamilia"]),
                                numberPicture: 2,
                                dataPicket1: (document["dataPicket1"]),
                                nome1: (document["nome1"]),
                                distanciadb1:
                                    (document["distanciadb1"]).roundToDouble(),
                                luadiadb1: (document["luadiadb1"]),
                                proximodb: (document["proximodb"]),
                                signo1: (document["signo1"]),
                                timedb1: (document["timedb1"]),
                                timenasc1: (document["timenasc1"]),
                                hemisferio: (document["hemisferio"]),
                                dataPicket2: (document["dataPicket2"]),
                                nome2: (document["nome2"]),
                                distanciadb2:
                                    (document["distanciadb2"]).roundToDouble(),
                                luadiadb2: (document["luadiadb2"]),
                                proximodb2: (document["proximodb2"]),
                                signo2: (document["signo2"]),
                                timedb2: (document["timedb2"]),
                                timenasc2: (document["timenasc2"]),
                                hemisferio2: (document["hemisferio2"]),
                              )));
                } else if (document["numberPicture"] == 3)
//
                {
                  if (document["hemisferio"] == null) {
                    _hemisferio = "sul";
                  } else {
                    _hemisferio = document["hemisferio"];
                  }
                  //
                  if (document["hemisferio2"] == null) {
                    _hemisferio2 = "sul";
                  } else {
                    _hemisferio2 = document["hemisferio2"];
                  }
                  //
                  if (document["hemisferio3"] == null) {
                    _hemisferio3 = "sul";
                  } else {
                    _hemisferio3 = document["hemisferio3"];
                  }
                  //
                  if (document["timenasc1"] == null) {
                    _timenasc1 = "9999";
                  } else {
                    _timenasc1 = document["timenasc1"];
                  }
                  if (document["timenasc2"] == null) {
                    _timenasc2 = "9999";
                  } else {
                    _timenasc2 = document["timenasc2"];
                  }
                  if (document["timenasc3"] == null) {
                    _timenasc3 = "9999";
                  } else {
                    _timenasc3 = document["timenasc3"];
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageFoto3(
                                email: widget.email,
                                codVenda: (document["codVenda"]),
                                nomefamilia: (document["nomefamilia"]),
                                numberPicture: 3,
                                dataPicket1: (document["dataPicket1"]),
                                nome1: (document["nome1"]),
                                distanciadb1:
                                    (document["distanciadb1"]).roundToDouble(),
                                luadiadb1: (document["luadiadb1"]),
                                proximodb: (document["proximodb"]),
                                signo1: (document["signo1"]),
                                timedb1: (document["timedb1"]),
                                timenasc1: (document["timenasc1"]),
                                hemisferio: (document["hemisferio"]),
                                dataPicket2: (document["dataPicket2"]),
                                nome2: (document["nome2"]),
                                distanciadb2:
                                    (document["distanciadb2"]).roundToDouble(),
                                luadiadb2: (document["luadiadb2"]),
                                proximodb2: (document["proximodb2"]),
                                signo2: (document["signo2"]),
                                timedb2: (document["timedb2"]),
                                timenasc2: (document["timenasc2"]),
                                hemisferio2: (document["hemisferio2"]),
                                dataPicket3: (document["dataPicket3"]),
                                nome3: (document["nome3"]),
                                distanciadb3:
                                    (document["distanciadb3"]).roundToDouble(),
                                luadiadb3: (document["luadiadb3"]),
                                proximodb3: (document["proximodb3"]),
                                signo3: (document["signo3"]),
                                timedb3: (document["timedb3"]),
                                timenasc3: (document["timenasc3"]),
                                hemisferio3: (document["hemisferio3"]),
                              )));
                } else if (document["numberPicture"] == 4) {
                  //
                  if (document["hemisferio"] == null) {
                    _hemisferio = "sul";
                  } else {
                    _hemisferio = document["hemisferio"];
                  }
                  //
                  if (document["hemisferio2"] == null) {
                    _hemisferio2 = "sul";
                  } else {
                    _hemisferio2 = document["hemisferio2"];
                  }
                  //
                  if (document["hemisferio3"] == null) {
                    _hemisferio3 = "sul";
                  } else {
                    _hemisferio3 = document["hemisferio3"];
                  }
                  //
                  if (document["hemisferio4"] == null) {
                    _hemisferio4 = "sul";
                  } else {
                    _hemisferio4 = document["hemisferio4"];
                  }
                  //
                  if (document["timenasc1"] == null) {
                    _timenasc1 = "9999";
                  } else {
                    _timenasc1 = document["timenasc1"];
                  }
                  if (document["timenasc2"] == null) {
                    _timenasc2 = "9999";
                  } else {
                    _timenasc2 = document["timenasc2"];
                  }
                  if (document["timenasc3"] == null) {
                    _timenasc3 = "9999";
                  } else {
                    _timenasc3 = document["timenasc3"];
                  }
                  if (document["timenasc4"] == null) {
                    _timenasc4 = "9999";
                  } else {
                    _timenasc4 = document["timenasc4"];
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageFoto4(
                                email: widget.email,
                                codVenda: (document["codVenda"]),
                                nomefamilia: (document["nomefamilia"]),
                                numberPicture: 4,
                                dataPicket1: (document["dataPicket1"]),
                                nome1: (document["nome1"]),
                                distanciadb1:
                                    (document["distanciadb1"]).roundToDouble(),
                                luadiadb1: (document["luadiadb1"]),
                                proximodb: (document["proximodb"]),
                                signo1: (document["signo1"]),
                                timedb1: (document["timedb1"]),
                                timenasc1: (document["timenasc1"]),
                                hemisferio: (document["hemisferio"]),
                                dataPicket2: (document["dataPicket2"]),
                                nome2: (document["nome2"]),
                                distanciadb2:
                                    (document["distanciadb2"]).roundToDouble(),
                                luadiadb2: (document["luadiadb2"]),
                                proximodb2: (document["proximodb2"]),
                                signo2: (document["signo2"]),
                                timedb2: (document["timedb2"]),
                                timenasc2: (document["timenasc2"]),
                                hemisferio2: (document["hemisferio2"]),
                                dataPicket3: (document["dataPicket3"]),
                                nome3: (document["nome3"]),
                                distanciadb3:
                                    (document["distanciadb3"]).roundToDouble(),
                                luadiadb3: (document["luadiadb3"]),
                                proximodb3: (document["proximodb3"]),
                                signo3: (document["signo3"]),
                                timedb3: (document["timedb3"]),
                                timenasc3: (document["timenasc3"]),
                                hemisferio3: (document["hemisferio3"]),
                                dataPicket4: (document["dataPicket4"]),
                                nome4: (document["nome4"]),
                                distanciadb4:
                                    (document["distanciadb4"]).roundToDouble(),
                                luadiadb4: (document["luadiadb4"]),
                                proximodb4: (document["proximodb4"]),
                                signo4: (document["signo4"]),
                                timedb4: (document["timedb4"]),
                                timenasc4: (document["timenasc4"]),
                                hemisferio4: (document["hemisferio4"]),
                              )));
//

                } else if (document["numberPicture"] == 5) {
                  //
                  if (document["hemisferio"] == null) {
                    _hemisferio = "sul";
                  } else {
                    _hemisferio = document["hemisferio"];
                  }
                  //
                  if (document["hemisferio2"] == null) {
                    _hemisferio2 = "sul";
                  } else {
                    _hemisferio2 = document["hemisferio2"];
                  }
                  //
                  if (document["hemisferio3"] == null) {
                    _hemisferio3 = "sul";
                  } else {
                    _hemisferio3 = document["hemisferio3"];
                  }
                  //
                  if (document["hemisferio4"] == null) {
                    _hemisferio4 = "sul";
                  } else {
                    _hemisferio4 = document["hemisferio4"];
                  }
                  //
                  if (document["hemisferio5"] == null) {
                    _hemisferio5 = "sul";
                  } else {
                    _hemisferio5 = document["hemisferio5"];
                  }
                  //
                  if (document["timenasc1"] == null) {
                    _timenasc1 = "9999";
                  } else {
                    _timenasc1 = document["timenasc1"];
                  }
                  if (document["timenasc2"] == null) {
                    _timenasc2 = "9999";
                  } else {
                    _timenasc2 = document["timenasc2"];
                  }
                  if (document["timenasc3"] == null) {
                    _timenasc3 = "9999";
                  } else {
                    _timenasc3 = document["timenasc3"];
                  }
                  if (document["timenasc4"] == null) {
                    _timenasc4 = "9999";
                  } else {
                    _timenasc4 = document["timenasc4"];
                  }
                  if (document["timenasc5"] == null) {
                    _timenasc5 = "9999";
                  } else {
                    _timenasc5 = document["timenasc5"];
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageFoto5(
                                email: widget.email,
                                codVenda: (document["codVenda"]),
                                nomefamilia: (document["nomefamilia"]),
                                numberPicture: 3,
                                dataPicket1: (document["dataPicket1"]),
                                nome1: (document["nome1"]),
                                distanciadb1:
                                    (document["distanciadb1"]).roundToDouble(),
                                luadiadb1: (document["luadiadb1"]),
                                proximodb: (document["proximodb"]),
                                signo1: (document["signo1"]),
                                timedb1: (document["timedb1"]),
                                timenasc1: (document["timenasc1"]),
                                hemisferio: (document["hemisferio"]),
                                dataPicket2: (document["dataPicket2"]),
                                nome2: (document["nome2"]),
                                distanciadb2:
                                    (document["distanciadb2"]).roundToDouble(),
                                luadiadb2: (document["luadiadb2"]),
                                proximodb2: (document["proximodb2"]),
                                signo2: (document["signo2"]),
                                timedb2: (document["timedb2"]),
                                timenasc2: (document["timenasc2"]),
                                hemisferio2: (document["hemisferio2"]),
                                dataPicket3: (document["dataPicket3"]),
                                nome3: (document["nome3"]),
                                distanciadb3:
                                    (document["distanciadb3"]).roundToDouble(),
                                luadiadb3: (document["luadiadb3"]),
                                proximodb3: (document["proximodb3"]),
                                signo3: (document["signo3"]),
                                timedb3: (document["timedb3"]),
                                timenasc3: (document["timenasc3"]),
                                hemisferio3: (document["hemisferio3"]),
                                dataPicket4: (document["dataPicket4"]),
                                nome4: (document["nome4"]),
                                distanciadb4:
                                    (document["distanciadb4"]).roundToDouble(),
                                luadiadb4: (document["luadiadb4"]),
                                proximodb4: (document["proximodb4"]),
                                signo4: (document["signo4"]),
                                timedb4: (document["timedb4"]),
                                timenasc4: (document["timenasc4"]),
                                hemisferio4: (document["hemisferio4"]),
                                dataPicket5: (document["dataPicket5"]),
                                nome5: (document["nome5"]),
                                distanciadb5:
                                    (document["distanciadb5"]).roundToDouble(),
                                luadiadb5: (document["luadiadb5"]),
                                proximodb5: (document["proximodb5"]),
                                signo5: (document["signo5"]),
                                timedb5: (document["timedb5"]),
                                timenasc5: (document["timenasc5"]),
                                hemisferio5: (document["hemisferio5"]),
                              )));
                } else if (document["numberPicture"] == 6) {
                  if (document["hemisferio"] == null) {
                    _hemisferio = "sul";
                  } else {
                    _hemisferio = document["hemisferio"];
                  }
                  //
                  if (document["hemisferio2"] == null) {
                    _hemisferio2 = "sul";
                  } else {
                    _hemisferio2 = document["hemisferio2"];
                  }

                  //
                  if (document["hemisferio3"] == null) {
                    _hemisferio3 = "sul";
                  } else {
                    _hemisferio3 = document["hemisferio3"];
                  }
                  //
                  if (document["hemisferio4"] == null) {
                    _hemisferio4 = "sul";
                  } else {
                    _hemisferio4 = document["hemisferio4"];
                  }
                  //
                  if (document["hemisferio5"] == null) {
                    _hemisferio5 = "sul";
                  } else {
                    _hemisferio5 = document["hemisferio5"];
                  }
                  //
                  if (document["hemisferio6"] == null) {
                    _hemisferio6 = "sul";
                  } else {
                    _hemisferio6 = document["hemisferio6"];
                  }
                  //
                  if (document["timenasc1"] == null) {
                    _timenasc1 = "9999";
                  } else {
                    _timenasc1 = document["timenasc1"];
                  }
                  if (document["timenasc2"] == null) {
                    _timenasc2 = "9999";
                  } else {
                    _timenasc2 = document["timenasc2"];
                  }
                  if (document["timenasc3"] == null) {
                    _timenasc3 = "9999";
                  } else {
                    _timenasc3 = document["timenasc3"];
                  }
                  if (document["timenasc4"] == null) {
                    _timenasc4 = "9999";
                  } else {
                    _timenasc4 = document["timenasc4"];
                  }
                  if (document["timenasc5"] == null) {
                    _timenasc5 = "9999";
                  } else {
                    _timenasc5 = document["timenasc5"];
                  }
                  if (document["timenasc6"] == null) {
                    _timenasc6 = "9999";
                  } else {
                    _timenasc6 = document["timenasc6"];
                  }
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PageFoto6(
                                email: widget.email,
                                codVenda: (document["codVenda"]),
                                nomefamilia: (document["nomefamilia"]),
                                numberPicture: 6,
                                dataPicket1: (document["dataPicket1"]),
                                nome1: (document["nome1"]),
                                distanciadb1:
                                    (document["distanciadb1"]).roundToDouble(),
                                luadiadb1: (document["luadiadb1"]),
                                proximodb: (document["proximodb"]),
                                signo1: (document["signo1"]),
                                timedb1: (document["timedb1"]),
                                timenasc1: (document["timenasc1"]),
                                hemisferio: (document["hemisferio"]),
                                dataPicket2: (document["dataPicket2"]),
                                nome2: (document["nome2"]),
                                distanciadb2:
                                    (document["distanciadb2"]).roundToDouble(),
                                luadiadb2: (document["luadiadb2"]),
                                proximodb2: (document["proximodb2"]),
                                signo2: (document["signo2"]),
                                timedb2: (document["timedb2"]),
                                timenasc2: (document["timenasc2"]),
                                hemisferio2: (document["hemisferio2"]),
                                dataPicket3: (document["dataPicket3"]),
                                nome3: (document["nome3"]),
                                distanciadb3:
                                    (document["distanciadb3"]).roundToDouble(),
                                luadiadb3: (document["luadiadb3"]),
                                proximodb3: (document["proximodb3"]),
                                signo3: (document["signo3"]),
                                timedb3: (document["timedb3"]),
                                timenasc3: (document["timenasc3"]),
                                hemisferio3: (document["hemisferio3"]),
                                dataPicket4: (document["dataPicket4"]),
                                nome4: (document["nome4"]),
                                distanciadb4:
                                    (document["distanciadb4"]).roundToDouble(),
                                luadiadb4: (document["luadiadb4"]),
                                proximodb4: (document["proximodb4"]),
                                signo4: (document["signo4"]),
                                timedb4: (document["timedb4"]),
                                timenasc4: (document["timenasc4"]),
                                hemisferio4: (document["hemisferio4"]),
                                dataPicket5: (document["dataPicket5"]),
                                nome5: (document["nome5"]),
                                distanciadb5:
                                    (document["distanciadb5"]).roundToDouble(),
                                luadiadb5: (document["luadiadb5"]),
                                proximodb5: (document["proximodb5"]),
                                signo5: (document["signo5"]),
                                timedb5: (document["timedb5"]),
                                timenasc5: (document["timenasc5"]),
                                hemisferio5: (document["hemisferio5"]),
                                dataPicket6: (document["dataPicket6"]),
                                nome6: (document["nome6"]),
                                distanciadb6:
                                    (document["distanciadb6"]).roundToDouble(),
                                luadiadb6: (document["luadiadb6"]),
                                proximodb6: (document["proximodb6"]),
                                signo6: (document["signo6"]),
                                timedb6: (document["timedb6"]),
                                timenasc6: (document["timenasc6"]),
                                hemisferio6: (document["hemisferio6"]),
                              )));
                }
              },
            );
          }).toList(),
        );
      },
    );
  }
}
