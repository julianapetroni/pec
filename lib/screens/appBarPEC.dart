import 'package:flutter/material.dart';
import 'package:pec/domains/usuario.dart';
import 'package:pec/screens/alterarCadastro.dart';
import 'package:pec/screens/regrasEmissao.dart';
import 'package:pec/screens/termosDeUso.dart';
import 'login.dart';
import 'novaSenha.dart';

class AppBarPEC extends AppBar {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  AppBarPEC({Key key, Widget title})
      : super(
    key: key,
    title: title,
    backgroundColor: Colors.grey[100],
    iconTheme: new IconThemeData(color: Colors.grey[600]),
  );
}

class MyDrawer extends Drawer {
  var cancelar = 'CANCELADO';

  Usuario user;
  Token token;

  MyDrawer({Key key, this.user, this.token})
      : super(
    key: key,
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.grey[300],
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
              const EdgeInsets.only(left: 30.0, top: 40.0, bottom: 30.0),
              child: Text("Menu",
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.grey[700],
                      fontFamily: "Poppins-Bold",
                      letterSpacing: .6)),
            ),
            new ListTile(
              title: new Text('Alterar Cadastro'),
              leading: Icon(Icons.person),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlterarCadastro(user: user, token: token)),
                );
              },
            ),
            new ListTile(
              title: new Text('Alterar Senha'),
              leading: Icon(Icons.lock),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NovaSenha(user: user)),
                );
              },
            ),
//            new ListTile(
//              title: new Text('Termos de Uso'),
//              leading: Icon(Icons.folder),
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => TermosDeUso()),
//                );
//              },
//            ),
            new ExpansionTile(
              title: new Text('Tarifas administrativas'),
              leading: Icon(Icons.monetization_on),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Text('Emissão ou Revalidação PEC Escolar 50% e PEC Passe Livre',
                                style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(children: <Widget>[
                        Flexible(
                            child: Text('05 Tarifas Vigentes')),
                      ],),
                      SizedBox(height: 20.0,),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Text('Bilhete Único Municipal',
                                style: TextStyle(fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(children: <Widget>[
                        Flexible(
                            child: Text('Taxa de 05 tarifas vigentes (valores convertidos em crédito para o cartão)')),
                      ],),
                      SizedBox(height: 20.0,),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Text('Emissão UNIPEC',
                                  style: TextStyle(fontWeight: FontWeight.bold))),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Text('05 Tarifas Vigentes (Convertidos em Recarga para o Cartão)')),
                        ],
                      ),

                      SizedBox(height: 20.0,),
                      Row(
                        children: <Widget>[
                          Flexible(
                            child: Text('2º Via de Cartões',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: 5.0,),
                      Row(
                        children: <Widget>[
                          Flexible(
                              child: Text('10 Tarifas Vigentes')),
                        ],
                      ),
//                    Center(
//                      child: Row(
//                        children: <Widget>[
//                          Spacer(),
//                          FlatButton(
//                              onPressed: () {
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                      builder: (context) => StatusFinal(
//                                        cancelar: cancelar,
//                                      ),
//                                    ));
//                              },
//                              child: Text('Sim')),
//                          FlatButton(
//                              onPressed: () {
//                                Navigator.pop(context);
//                              },
//                              child: Text('Não')),
//                        ],
//                      ),
//                    ),
                    ],
                  ),
                )
              ],
//              onTap: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => StatusFinal()),
//                );
//              },
            ),
            new ListTile(
              title: new Text('Regras para emissão'),
              leading: Icon(Icons.playlist_add_check),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegrasEmissao()),
                );
              },
            ),

//            new ExpansionTile(
//              title: new Text('Cancelar Agendamento'),
//              leading: Icon(Icons.access_time),
//              children: <Widget>[
//                new Column(
//                  children: <Widget>[
//                    Text('Deseja cancelar o seu processo?'),
//                    Center(
//                      child: Row(
//                        children: <Widget>[
//                          Spacer(),
//                          FlatButton(
//                              onPressed: () {
//                                Navigator.push(
//                                    context,
//                                    MaterialPageRoute(
//                                      builder: (context) => StatusFinal(
//                                        cancelar: cancelar,
//                                      ),
//                                    ));
//                              },
//                              child: Text('Sim')),
//                          FlatButton(
//                              onPressed: () {
//                                Navigator.pop(context);
//                              },
//                              child: Text('Não')),
//                        ],
//                      ),
//                    ),
//                  ],
//                )
//              ],
////              onTap: () {
////                Navigator.push(
////                  context,
////                  MaterialPageRoute(builder: (context) => StatusFinal()),
////                );
////              },
//            ),
            new ListTile(
              title: new Text(
                'Sair',
                style: TextStyle(color: Colors.red),
              ),
              leading: Icon(
                Icons.exit_to_app,
                color: Colors.red,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaLogin()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}