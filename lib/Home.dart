import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'classes/boxData.dart';
import 'pages/GeraFotos.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  double _value7 = 1.00;
  double _value8 = 27.00;
  bool mostralista = true;
  bool mostralistPage = false;
  int _tabIndex = 0;
  bool _tela = false;
  String _v1 = 'A';
  String _v2 = 'Z';
  @override
  void _toggleTab() {
    _tabIndex = _controller.index + 1;
    _controller.animateTo(_tabIndex);
  }

  void initState() {
    _controller = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widthlua = MediaQuery.of(context).size.width;
    final heightlua = MediaQuery.of(context).size.height;

    //
    bool portrait = (widthlua > 600 ? false : true);

    List<DropdownMenuItem<String>> getDropDownItems() {
      List<DropdownMenuItem<String>> dropdownItem = [];
      for (String currency in alfaList) {
        var newItem = DropdownMenuItem(child: Text(currency), value: currency);
        dropdownItem.add(newItem);
      }
      return dropdownItem;
    }

    List<DropdownMenuItem<String>> getDropDownItems2() {
      List<DropdownMenuItem<String>> dropdownItem = [];
      for (String currency in alfaList) {
        var newItem2 = DropdownMenuItem(child: Text(currency), value: currency);
        dropdownItem.add(newItem2);
      }
      return dropdownItem;
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
              appBar: AppBar(
                centerTitle: true,
                title: Text("No Mundo das Luas - Gera Fotos"),
                leading: GestureDetector(
                    onTap: () {},
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
                        icon: Icon(Icons.science_outlined,
                            color: Colors.white, size: 40.0)),
                    Tab(
                        icon:
                            Icon(Icons.email, color: Colors.white, size: 40.0)),
                  ],
                ),
              ),
              body: TabBarView(
                  //  controller: _controller,
                  children: [
                    //
                    //tab 1
                    //
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(children: [
                        Container(
                            width: widthlua,
                            height: heightlua * 0.6,
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                      child: Container(
                                        width: double.infinity,
                                        alignment: Alignment.center,
                                        decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: new Border.all(
                                              color: Colors.deepOrange,
                                            )),
                                        child: DropdownButton<String>(
                                            value: _v1,
                                            items: getDropDownItems(),
                                            dropdownColor:
                                                Colors.orangeAccent[200],
                                            icon:
                                                Icon(Icons.filter_alt_outlined),
                                            iconSize: 60,
                                            elevation: 16,
                                            // isExpanded: true,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 40.0),
                                            onChanged: (value) {
                                              setState(() {
                                                _v1 = value!;
                                              });
                                            }),
                                      ),
                                    )),
                                Expanded(flex: 1, child: Container()),
                                Expanded(
                                    flex: 1,
                                    child: Align(
                                      child: Container(
                                        alignment: Alignment.center,
                                        width: double.infinity,
                                        decoration: new BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(20.0)),
                                            border: new Border.all(
                                                color: Colors.deepOrange)),
                                        child: DropdownButton<String>(
                                            value: _v2,
                                            items: getDropDownItems2(),
                                            icon:
                                                Icon(Icons.filter_alt_outlined),
                                            iconSize: 60,
                                            elevation: 16,
                                            dropdownColor:
                                                Colors.orangeAccent[200],
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 40.0),
                                            onChanged: (value) {
                                              setState(() {
                                                _v2 = value!;
                                              });
                                            }),
                                      ),
                                    )),
                                Expanded(flex: 1, child: Container()),
                              ],
                            ))
                      ]),
                      //
                    ),
                    //
                    // tab 2
                    //

                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: ListPage(_v1.toLowerCase(), _v2.toLowerCase()),
                    )
                  ])),
        ));

    //
    //
  }
}

class ListPage extends StatefulWidget {
  String f1;
  String f2;

  ListPage(this.f1, this.f2);
  @override
  _ListPageState createState() => _ListPageState();
}

//
//
//
class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
        .collection('usuarios')
        .where(FieldPath.documentId, isGreaterThanOrEqualTo: widget.f1)
        .where(FieldPath.documentId, isLessThanOrEqualTo: widget.f2)
        .snapshots();
    //
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
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
              title: new Text(document.id),
              subtitle: new Text(document['name']),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            GeraFotos(document['name'], document.id)));
              },
            );
          }).toList(),
        );
      },
    );
  }
}
