//import 'package:autocomplete_textfield/autocomplete_textfield.dart';
//import 'package:flutter/material.dart';
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:rflutter_alert/rflutter_alert.dart';
//import 'package:pec_login/models/solicitacao.dart';
//import 'docsNecessarios.dart';
//
//class User {
//  String nome;
//
//  User({this.nome});
//
//  factory User.fromJson(Map<String, dynamic> parsedJson) {
//    return User(
//      nome: parsedJson["nome"] as String,
//    );
//  }
//}
//
//class SelecionarInstituicao extends StatefulWidget {
//  int botaoIniciar;
//  Solicitacao sol;
//
//  SelecionarInstituicao({Key key, this.botaoIniciar, this.sol})
//      : super(key: key);
//
//  @override
//  SelecionarInstituicaoState createState() {
//    return SelecionarInstituicaoState();
//  }
//}
//
//class SelecionarInstituicaoState extends State<SelecionarInstituicao> {
//  List<dynamic> _docs = [];
//  final String appTitle = '';
//
//  //Alerta
//  var alertStyle = AlertStyle(
//      titleStyle: TextStyle(
//          color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 24),
//      descStyle: TextStyle(color: Colors.grey));
//
//  void initState() {
//    super.initState();
//    getUsers();
//    _fetchDocs();
//  }
//
//  final _scaffoldKey = GlobalKey<ScaffoldState>();
//
//  void _fetchDocs() {
//    //print(widget.botaoIniciar);
//
//    http
//        .get(
//            'http://179.190.40.41:443/api/v1/instituicoes/?access_token=b7060893-0678-4e51-95e8-9b4fecf91bb9')
//        .then((res) {
//      final docs = json.decode(res.body);
//
//      setState(() {
//        _docs = docs;
//      });
//    });
//  }
//
//  //Autocomplete Instituicao de ensino
//  final _text = TextEditingController();
//  AutoCompleteTextField searchTextField;
//  GlobalKey<AutoCompleteTextFieldState<User>> key = new GlobalKey();
//  static List<User> users = new List<User>();
//  bool loading = true;
//
//  void getUsers() async {
//    try {
//      final response = await http.get(
//          "http://179.190.40.41:443/api/v1/instituicoes/?access_token=b7060893-0678-4e51-95e8-9b4fecf91bb9");
//      if (response.statusCode == 200) {
//        users = loadUsers(response.body);
//        //print('Users: ${users.length}');
//        setState(() {
//          loading = false;
//        });
//      } else {
//        print("Erro ao buscar Instituições de Ensino.");
//      }
//    } catch (e) {
//      print("Erro ao buscar Instituições de Ensino.");
//    }
//  }
//
//  static List<User> loadUsers(String jsonString) {
//    final parsed = json.decode(jsonString).cast<Map<String, dynamic>>();
//    return parsed.map<User>((json) => User.fromJson(json)).toList();
//  }
//
//  Widget row(User user) {
//    return Row(
//      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//      children: <Widget>[
//        Expanded(
//          child: Text(
//            user.nome,
//            style: TextStyle(fontSize: 16.0),
//            textAlign: TextAlign.justify,
//            overflow: TextOverflow.ellipsis,
//            maxLines: 1,
//          ),
//        ),
//      ],
//    );
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//        key: _scaffoldKey,
//        appBar: AppBar(
//          iconTheme: new IconThemeData(color: Colors.grey[600]),
//          title: Center(
//              child: Text(
//            ' ',
//            style: TextStyle(color: Colors.grey[500]),
//          )),
//          backgroundColor: Colors.grey[100],
//        ),
//        backgroundColor: Colors.white,
//        body: Stack(
//          children: <Widget>[
//            Container(
//              margin: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
//              child: Column(
//                children: <Widget>[
//                  Center(
//                    child: Image(
//                      image: AssetImage('images/PECLogo.png'),
//                      height: 100.0,
//                    ),
//                  ),
//                ],
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(top: 200.0, left: 30.0),
//              child: Container(
//                child: Text(
//                  'SELECIONE A INSTITUIÇÃO DO ALUNO:',
//                  textAlign: TextAlign.center,
//                  style: TextStyle(
//                      color: Colors.grey[500],
//                      fontSize: 16,
//                      fontWeight: FontWeight.bold),
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  loading
//                      ? CircularProgressIndicator()
//                      : searchTextField = AutoCompleteTextField<User>(
//                          controller: _text,
//                          key: key,
//                          clearOnSubmit: false,
//                          suggestions: users,
//                          style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 16.0,
//                          ),
//                          decoration: InputDecoration(
//                            contentPadding:
//                                EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 20.0),
//                            hintText: "Pesquisar Instituição de Ensino",
//                            hintStyle: TextStyle(color: Colors.blue[700]),
//                          ),
//                          itemFilter: (item, query) {
//                            return item.nome
//                                .toLowerCase()
//                                .startsWith(query.toLowerCase());
//                          },
//                          itemSorter: (a, b) {
//                            return a.nome.compareTo(b.nome);
//                          },
//                          itemSubmitted: (item) {
//                            setState(() {
//                              searchTextField.textField.controller.text =
//                                  item.nome;
//                            });
//                          },
//                          itemBuilder: (context, item) {
//                            // ui for the autocomplete row
//                            return row(item);
//                          },
//                        ),
//                ],
//              ),
//            ),
//          ],
//        ),
//        bottomNavigationBar: Padding(
//          padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 70.0),
//          child: new InkWell(
//            onTap: () {
//              if (_text.text.isEmpty == true) {
//                Alert(
//                  style: alertStyle,
//                  context: context,
//                  title: "Atenção!",
//                  desc: "Escolha a Instituição de Ensino para prosseguir\n",
//                  buttons: [
//                    DialogButton(
//                      child: Text("OK",
//                          style: TextStyle(
//                              color: Colors.white,
//                              fontSize: 18,
//                              fontWeight: FontWeight.bold)),
//                      onPressed: () => Navigator.pop(context),
//                      color: Colors.green[400],
//                      radius: BorderRadius.circular(10.0),
//                    )
//                  ],
//                ).show();
//              } else {
//                var route = new MaterialPageRoute(
//                  builder: (BuildContext context) => new Documentos(
//                      //value: _text.text, botaoIniciar: widget.botaoIniciar
//                      ),
//                );
//                Navigator.of(context).push(route);
//              }
//            },
//            child: new Container(
//              width: double.infinity,
//              height: 50.0,
//              decoration: new BoxDecoration(
//                borderRadius: BorderRadius.circular(15.0),
//                gradient: LinearGradient(
//                  colors: <Color>[
//                    Color(0xFF33691E),
//                    Color(0xFF689F38),
//                    Color(0xFF8BC34A),
//                  ],
//                ),
//              ),
//              child: new Center(
//                child: Row(
//                  children: <Widget>[
//                    Spacer(
//                      flex: 3,
//                    ),
//                    const Text('AVANÇAR',
//                        style: TextStyle(fontSize: 20, color: Colors.white)),
//                    Spacer(
//                      flex: 3,
//                    ),
//                    Icon(Icons.chevron_right, color: Colors.white),
//                  ],
//                ),
//              ),
//            ),
//          ),
//        ));
//  }
//}
