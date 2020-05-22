import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pec/domains/usuario.dart';
import 'package:pec/screens/fotosDosDocs.dart';
import 'appBarPEC.dart';
import 'package:pec/domains/solicitacao.dart';

import 'login.dart';

class Documentos extends StatefulWidget {
  //final String value;

  Solicitacao sol;
  Usuario user;
  Token token;

  Documentos(
      {Key key,
        // this.value,
        this.sol, this.user, this.token})
      : super(key: key);

  @override
  _DocumentosState createState() => new _DocumentosState(sol: sol, user: user, token: token);
}

class _DocumentosState extends State<Documentos> {

  Solicitacao sol;
  Usuario user;
  Token token;
  _DocumentosState({this.sol, this.user, this.token});

  List<dynamic> _docs = [];

  int tipoSolicitacao;

  void initState() {
    super.initState();

    _fetchDocs();
  }

  void _fetchDocs() {
    print(sol.tipoSolicitacao.id.toString()+ "docsneed");
    http
        .get("http://179.190.40.41:443/api/v1/documentos/tiposolicitacao/" +
        sol.tipoSolicitacao.id.toString() +
        "/status/ATIVO/?access_token=" + token.access_token.toString())
        .then((res) {
      final docs = json.decode(res.body);

      setState(() {
        _docs = docs;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
//    print('to no docs necessarios');
    return Scaffold(
        appBar: AppBarPEC(
      title: Text(' '),
    ),
        endDrawer: MyDrawer(user: user),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Image(
                        image: AssetImage('images/PECLogo.png'),
                        height: 70.0,
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(10, 130, 10, 20),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: Stack(
                            children: <Widget>[
                              Text(
                                'DOCUMENTOS QUE VOCÊ PRECISA TER EM MÃOS PARA O CADASTRO:',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.grey[500],
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  isThreeLine: true,
                  subtitle: Container(
                    child: _DocList(docs: _docs),
                  )),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 35.0),
          child: new InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  // return object of type Dialog
                  return AlertDialog(
                    title: Center(
                        child: new Text(
                          "Atenção!",
                          textAlign: TextAlign.center,
                        )),
                    content: new Text(
                      'Hora de tirar foto dos documentos!\n\nRemova-os dos plásticos, tenha certeza de que está em um ambiente iluminado e que as fotos estão com todos os dados legíveis, incluindo os textos.',
                      textAlign: TextAlign.center,
                    ),
                    actions: <Widget>[
                      // usually buttons at the bottom of the dialog
                      new FlatButton(
                        child: new Text(
                          "Prosseguir",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TirarFotosDocs(
                                    sol: sol,
                                  user: user,
                                  token: token
                                )),
                          );
                        },
                      ),
                    ],
                  );
                },
              );
            },
            child: new Container(
              width: double.infinity,
              height: 50.0,
              decoration: new BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                gradient: LinearGradient(
                  colors: <Color>[
                    Color(0xFF33691E),
                    Color(0xFF689F38),
                    Color(0xFF8BC34A),
                  ],
                ),
              ),
              child: new Center(
                child: Row(
                  children: <Widget>[
                    Spacer(
                      flex: 3,
                    ),
                    const Text('AVANÇAR',
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                    Spacer(
                      flex: 3,
                    ),
                    Icon(Icons.chevron_right, color: Colors.white),
                  ],

//                    Padding(
//                      padding: const EdgeInsets.only(top: 70),
//                      child: Text(
//                          'Hora de tirar foto dos documentos!\n\nRemova-os dos plásticos, tenha certeza de que está em um ambiente iluminado e que as fotos estão com todos os dados legíveis, incluindo os textos.',
//                          textAlign: TextAlign.justify,
//                          style: TextStyle(
//                              fontSize: 18.0,
//                              color: Colors.grey[600],
//                              fontFamily: "Poppins-Bold",
//                              letterSpacing: .6)),
//                    )
                ),
              ),
            ),
          ),
        ));
  }
}

class _DocList extends StatelessWidget {
  final List<dynamic> _docs;

  _DocList({@required List<dynamic> docs}) : _docs = docs;

  Widget build(BuildContext context) {
    Widget _tipoIcone(int index, List<dynamic> _docs) {
      if (_docs[index]['obrigatorio'] == 'N'
//      _docs[index]['nome'].toString().contains('2') ||
//          _docs[index]['nome'].toString().contains('3') ||
//          _docs[index]['nome'].toString().contains('4')
      ) {
        return Icon(Icons.radio_button_unchecked);
      } else {
        return Icon(
          Icons.radio_button_checked,
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 240),
      child: ListView.builder(
          itemCount: _docs.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.fromLTRB(0, 5.0, 0, 0),
              child: Container(
                width: double.infinity,
                // height: 50.0,
                child: ListTile(
                  leading: _tipoIcone(index, _docs),

                  title: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                    child: Text(_docs[index]['nome'],
                        textAlign: TextAlign.justify,
                        style: TextStyle(color: Colors.grey)),
                  ),
                  //subtitle: Text(_docs[i]['name']),
                ),
              ),
            );
          }),
    );
  }
}
