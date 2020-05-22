import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pec/domains/tipoSolicitacao.dart';
import 'package:pec/domains/usuario.dart';
import 'package:pec/domains/solicitacao.dart';
import 'appBarPEC.dart';
import 'docsNecessarios.dart';
import 'login.dart';

class IniciarSolicitacao extends StatefulWidget {

  Usuario user;
  Token token;

  IniciarSolicitacao(
      {Key key,
        // this.value,
        this.user, this.token})
      : super(key: key);


  @override
  IniciarSolicitacaoState createState() {
    return IniciarSolicitacaoState(user: user, token: token);
  }
}

class IniciarSolicitacaoState extends State<IniciarSolicitacao> {
  Usuario user;
  Token token;
  IniciarSolicitacaoState({this.user, this.token});
  Solicitacao s = new Solicitacao.vazio();

  //Map<String, dynamic> _tipoSolicitacao;
  List<dynamic> _tipoSolicitacao = [];


  @override
  void initState() {
    super.initState();

    this._fechTipoSolicitacao();
  }

  void _fechTipoSolicitacao() async {
    var res = await http.get(
        'http://179.190.40.41:443/api/v1/tiposSolicitacoes?access_token=' + token.access_token.toString());
    if(mounted){
      this.setState(() {
        _tipoSolicitacao = json.decode(res.body);
        print("APIII");

        //_tipoSolicitacao.forEach((k, v) => _tipoSolicitacaoList.add(Customer(k, v)));
        print(_tipoSolicitacao);

        //List<TipoSolicitacao> _tipoSolicitacao = jsonDecode(res.body);

        //TipoSolicitacao _tipoSolicitacao = TipoSolicitacao.fromJson(map);

        // widget.s.tipoSolicitacaoID = widget.s.tipoSolicitacaoID;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBarPEC(
          title: Text(' '),
        ),
        endDrawer: MyDrawer(user: user),
        body: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 30.0),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Image(
                      image: AssetImage('images/PECLogo.png'),
                      height: 100.0,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 160, 20, 30),
              child: Text(
                  'Para solicitar seu cartão PEC, consulte antes no menu as regras para opção desejada.',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 18.0,
                  )),
            ),
            Padding(
                padding: const EdgeInsets.only(top: 230.0),
                child: ListView.builder(
                  itemCount: _tipoSolicitacao.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: Stack(
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              _sendDataToSecondScreen(context, index);
                            },
                            //Navigator.pushNamed(context, '/listaDocs'),
                            child: Container(
                              width: double.infinity,
                              height: 50.0,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    Color(0xFF0D47A1),
                                    Color(0xFF1976D2),
                                    Color(0xFF42A5F5),
                                  ],
                                ),
                              ),
                              child: ListTile(
                                title: Padding(
                                  padding:
                                  const EdgeInsets.fromLTRB(0, 0, 0, 15),
                                  child: Center(
                                    child: Text(
                                      _tipoSolicitacao[index]['nome']
                                          .toUpperCase(),
                                      style: TextStyle(color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ],
        ));
  }

  // get the text in the TextField and start the Second Screen
  void _sendDataToSecondScreen(BuildContext context, int aux) {
    //int teste = int.parse(_tipoSolicitacao[aux]['codigo']);
    s.tipoSolicitacao = new TipoSolicitacao.init(_tipoSolicitacao[aux]['id'], _tipoSolicitacao[aux]['nome'], _tipoSolicitacao[aux]['codigo'], _tipoSolicitacao[aux]['descricao'], _tipoSolicitacao[aux]['instituicao'], _tipoSolicitacao[aux]['status']);
    s.cliente = user;
    s.cidade = user.cidade;
    //print(user.cidade.estado.sigla);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Documentos(sol: s, user: user, token: token)
        ));
    //}
  }
}