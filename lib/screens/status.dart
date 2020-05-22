import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pec/domains/agendamento.dart';
import 'package:pec/domains/dataAgendamento.dart';
import 'package:pec/domains/horaAgendamento.dart';
import 'package:pec/domains/usuario.dart';
import 'package:pec/domains/solicitacao.dart';
import 'package:pec/screens/iniciarSolicitacao.dart';
import 'agendarData.dart';
import 'appBarPEC.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

import 'login.dart';

class Status extends StatefulWidget {

  Usuario user;
  Token token;
  //HoraAgendamento ha;
  final String text;
  final String cancelar; // cancelar agendamento
  //final String value; // instituição de ensino
  Solicitacao sol;

  Status({Key key, this.user, @required this.token, this.text, this.sol, this.cancelar})
      : assert(user.id != null),
        super(key: key);

  @override
  StatusState createState() {
    return StatusState(user: user, sol: sol, token: token);
  }
}

class StatusState extends State<Status> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

//  String _textoData = ' ';
  String _textoHora = '';
  //data e hora cond 3

  Usuario user;
  Token token;
  Solicitacao sol;
  StatusState({this.user, this.sol, this.token});
  var botaoValue = '';
  int cond;
  String diaHora = '--T';
  String dataProducaoCartao = '--T';
  String dataParaRetirada = '--T';
  String dataEntregaCartao = '--T';
  String dataDaEntrevista = '--T';
  String _textoData = '--T';
  String statusSolicitacao;
  String motivoRejeicao;

  @override
  void initState() {
    super.initState();
    _makeGetRequest();
//    _makeHoraDataRequest();
  }


  _botaoEscolha(int cond) {
    if (cond == 0 || dataEntregaCartao != null) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 0, 8.0, 35.0),
        child: new InkWell(
          onTap: () {
            print(user.cidade.estado.sigla);
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => IniciarSolicitacao(user: user, token: token)),
            );
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => IniciarSolicitacao(user: user, token: token)),
                    (Route<dynamic> route) => false);
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
                  const Text('NOVA SOLICITAÇÃO',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Spacer(
                    flex: 3,
                  ),
                  Icon(Icons.chevron_right, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      );
    }
    else if(cond == 1){
      return Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 35.0),
        child: new InkWell(
          onTap: () {
            print(user.cidade.estado.sigla);
            print(sol);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AgendarData(sol: sol, user: user, token: token)),
            );
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => AgendarData(sol: sol, user: user, token: token)),
                    (Route<dynamic> route) => false);
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
                  const Text('AGENDAR',
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  Spacer(
                    flex: 3,
                  ),
                  Icon(Icons.chevron_right, color: Colors.white),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
  void printWrapped(String text) {
    final pattern = new RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

  Future _makeGetRequest() async{

    String url = //'http://179.190.40.41:443/api/v1/solicitacoes/cliente/' + user.id.toString() + '/status/ATIVO';

    'http://179.190.40.41:443/api/v1/solicitacoes/cliente/' + user.id.toString() + '/solicitacao/andamento';
    await http
        .get(url,
        headers: {
          'Authorization':
          'bearer ' + token.access_token.toString()
        })
        .then((http.Response res) {
      print("Response statuss: ${res.statusCode}");
      //print(res.headers);
      printWrapped("BODY: "+res.body);
      print(user.email);
      print(user.id);
      if(res.body == '' || res.body.contains('{\"id\":null,\"instituicao\":null,\"tipoSolicitacao\":null'))
      {
        print("sem nada");
        if(mounted) {
          setState(() {
            cond = 0;
          });
        }
        //botao inciar solicitação ativo para inciar nova solicitacao
      }
      else {
        Map<String, dynamic> map = jsonDecode(res.body);
        sol = Solicitacao.fromJson(map);
//        if(sol.id == 'null'){
//          print("sem nada");
//          if(mounted) {
//            setState(() {
//              cond = 0;
//            });
//          }
//        }

        if(mounted) {
          setState(() {
            diaHora = sol.data;
            dataProducaoCartao = sol.dataProducaoCartao;
            dataParaRetirada = sol.dataParaRetirada;
            dataEntregaCartao = sol.dataEntregaCartao;
            _textoData = sol.dataAgendamento;
            _textoHora = sol.horarioReservado;
            statusSolicitacao = sol.statusSolicitacao;
            motivoRejeicao = sol.motivoRejeicao;
          });

        }



        //var list = json.decode((res.body)) as List;
        //Iterable i = json.decode((res.body));
//        List<Solicitacao> teste = list.map((i) => Solicitacao.fromJson(i)).toList();
        //print(sol.statusSolicitacao.toString() + "enzo");

        if(statusSolicitacao == 'ACEITA'){
          //print("deveriaMUDAAAAAAAAAAAAAAR");
          if(mounted){
            setState((){
              cond = 1;
            });
          }
//          setState(() {
//            cond = 1;
//          });

          //ir para agendamento
        }
        else if(statusSolicitacao == 'INICIADA'){
          //consulta na propria tela
          if(mounted) {
            setState(() {
              cond = 2;
            });
          }
        }
        else if(statusSolicitacao == 'AGENDADA'){
          //consulta na propria tela
          print("AGENDADO!!");
          if(mounted){
            setState((){
              cond = 3;
            });
          }
        }
//        else if(dataProducaoCartao != null){
//          //consulta na propria tela
//          print("CARTÃO PRODUZIDO!!");
//          if(mounted){
//            setState((){
//              cond = 4;
//            });
//          }
//        }
//        else if(dataParaRetirada != null){
//          //consulta na propria tela
//          print("CARTÃO PARA RETIRADA!!");
//          if(mounted){
//            setState((){
//              cond = 5;
//            });
//          }
//        }
        else if(dataEntregaCartao != null){
          //pode pedir novo cartão
          print("CARTÃO ENTREGUE!!");
          if(mounted){
            setState((){
              cond = 6;
            });
          }
        }
        else if(statusSolicitacao == 'NEGADA' || (statusSolicitacao == 'APROVADA' && dataEntregaCartao != null)) {
          print(dataEntregaCartao.toString());
          //botao inciar solicitação ativo para inciar nova solicitacao

          if(mounted){
            setState(() {
              cond = 0;
            });
          }

        }
//apagar
//        cond = 0;
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    double a_width = MediaQuery.of(context).size.width*0.4;
    double b_width = MediaQuery.of(context).size.width*0.3;
    double title_width = MediaQuery.of(context).size.width*0.7;
    double title_height = MediaQuery.of(context).size.height*0.2;
    print(cond);
    Widget _dataAgendamento() {
      if (cond == 0) {
        print('cond = 0');
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else if(cond != 0){
        var texto3 = '';
        var texto = diaHora;
        var texto1 = texto.split("T");
        var texto2 = texto1[0].split("-");
        texto3 = texto2[2].toString() + "/" + texto2[1].toString() + "/" + texto2[0].toString();

        return Column(
          children: <Widget>[
            Text(
              texto3,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        );
      }
    }

    Widget _checkBoxAgendamento() {
      if (cond == 0) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }

    Widget _dataEntrevista() {
      if (cond == 0 || cond == 1 || cond == 2) {
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else {
        var textoDtAg3 = '';
        var textoDtAg = _textoData;
        print("DATAAAA: " + _textoData.toString());
//        if (textoDtAg.contains('T') == false){
//          print(_textoData);
//          textoDtAg == '--T';
//      }
        var textoDtAg1 = textoDtAg.split("T");
        var textoDtAg2 = textoDtAg1[0].split("-");
        textoDtAg3 =
            textoDtAg2[2].toString() + "/" + textoDtAg2[1].toString() + "/" +
                textoDtAg2[0].toString();

        return Column(
          children: <Widget>[

            Text(
              textoDtAg3,
//                sol.dataAgendamento,
//                _textoData,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            Text(
//                sol.horarioReservado,
              _textoHora,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),

          ],
        );
      }



    }

    Widget _checkBoxEntrevista() {
      if (cond == 0 || cond == 1 || cond == 2) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }

    Widget _dataProducaoCartao() {
      if (dataProducaoCartao == null) {
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else {
        //_makeHoraDataRequest();
        var textoProd3 = '';
        var textoProd = dataProducaoCartao;
        var textoProd1 = textoProd.split("T");
        var textoProd2 = textoProd1[0].split("-");
        textoProd3 = textoProd2[2].toString() + "/" + textoProd2[1].toString() + "/" + textoProd2[0].toString();

        return Column(
          children: <Widget>[
            Text(
//        sol.dataProducaoCartao,
              textoProd3,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        );
      }
    }

    Widget _checkBoxdataProducaoCartao() {
      if (dataProducaoCartao == null) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }

    Widget _dataParaRetirada() {
      if (dataParaRetirada == null) {
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else {
        var textoRet3 = '';
        var textoRet = dataParaRetirada;
        var textoRet1 = textoRet.split("T");
        var textoRet2 = textoRet1[0].split("-");
        textoRet3 = textoRet2[2].toString() + "/" + textoRet2[1].toString() + "/" + textoRet2[0].toString();

        //_makeHoraDataRequest();
        return Column(
          children: <Widget>[
            Text(
              //_textoDataParaRetirada,
//              sol.dataParaRetirada,
              textoRet3,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        );
      }
    }

    Widget _checkBoxdataParaRetirada() {
      if (dataParaRetirada == null) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }

    Widget _dataEntregaCartao() {
      if (dataEntregaCartao == null || cond == 0) {
        return Icon(
          Icons.access_time,
          color: Colors.grey[700],
          size: 18.0,
        );
      }
      else {
        var textoEntr3 = '';
        var textoEntr = dataEntregaCartao;
        var textoEntr1 = textoEntr.split("T");
        var textoEntr2 = textoEntr1[0].split("-");
        textoEntr3 = textoEntr2[2].toString() + "/" + textoEntr2[1].toString() + "/" + textoEntr2[0].toString();

        //_makeHoraDataRequest();
        return Column(
          children: <Widget>[
            Text(
              //_textoDataEntregaCartao,
//              sol.dataEntregaCartao,
              textoEntr3,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
          ],
        );
      }
    }

    Widget _checkBoxdataEntregaCartao() {
      if (dataEntregaCartao == null || cond == 0) {
        return Icon(
          Icons.check_box_outline_blank,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
      else {
        return Icon(
          Icons.check_box,
          color: Colors.grey[700],
          size: 20.0,
        );
      }
    }



    Widget _cancelar() {
      if (widget.cancelar == null) {
        return Text(' ');
      } else {
        return Column(
          children: <Widget>[
            Text(
              widget.cancelar,
              style: TextStyle(
                  color: Colors.red, fontWeight: FontWeight.bold, fontSize: 16.0),
            ),
          ],
        );
      }
    }



    Future<Null> _refresh() {
      return _makeGetRequest().
      then((Solicitacao) {
        setState(() =>  sol = sol);
      });
    }

    final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
    new GlobalKey<RefreshIndicatorState>();

    bool _isVisible = true;
    bool _motivoRejeicao = false;


    if( statusSolicitacao == 'NEGADA') {
      _isVisible = false;
      _motivoRejeicao = true;

    }

    return Scaffold(
        appBar: AppBarPEC(
          title: Text(' '),
        ),
        endDrawer: MyDrawer(user: user, token: token),
        backgroundColor: Colors.white,
        body:  SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, right: 20.0),
            child: RefreshIndicator(
              key: _refreshIndicatorKey,
              onRefresh: _refresh,
              child: Column(
                children: <Widget>[

//                   Flexible(
//                    flex: 1,
//                    child: Container(
//                      width: double.infinity,
//                      child: Padding(
//                        padding: const EdgeInsets.fromLTRB(30, 30, 30, 10),
//                        child: Center(
//                          child: Row(
//                            mainAxisAlignment: MainAxisAlignment.center,
//                            children: <Widget>[
//                              Image(
//                                image: AssetImage('images/PECLogo.png'),
//                              ),
//                            ],
//                           ),
//                          ),
//                        ),
//                      ),
//                    ),
//                    Flexible(
//                      flex: 0,
//                      child: Column(
//                        children: <Widget>[
//                          Padding(
//                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
//                            child: Container(
//                                alignment: Alignment.center,
//                                height: 65.0,
//                                width: double.infinity,
//                                child: Row(
//                                  mainAxisAlignment: MainAxisAlignment.center,
//                                  crossAxisAlignment: CrossAxisAlignment.center,
//                                  children: <Widget>[
//                                    Padding(
//                                      padding: const EdgeInsets.only(
//                                          left: 10.0, top: 10.0),
//                                      child: Icon(
//                                        Icons.hourglass_empty,
//                                        color: Colors.green,
//                                        size: 22.0,
//                                      ),
//                                    ),
//                                    SizedBox(
//                                      width: 20.0,
//                                    ),
//                                    Container(
//                                      width: title_width,
//                                      child: Padding(
//                                        padding: const EdgeInsets.only(top: 10.0),
//                                        child: Text(
//                                          'Documentos em análise',
//                                          style: TextStyle(
//                                              fontSize: 22.0,
//                                              color: Colors.green,
//                                              fontFamily: "Poppins-Bold",
//                                              letterSpacing: .6),
//                                        ),
//                                      ),
//                                    ),
//                                  ],
//                                )
////                              ],
////                            ),
//                              //        )
//                            ),
//                          ),
//                        ],
//                      )),
                  Flexible(
                      flex: 4,
                      child: Container(
                          alignment: Alignment.topCenter,
                          child: ListView(
                            padding: const EdgeInsets.only(top: 10.0, bottom: 20.0),
                            children: <Widget>[
                              Container(
                                height: title_height,
                                width: double.infinity,
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(30.0, 30.0, 30.0, 30.0),
                                  child: Center(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        Image(
                                          image: AssetImage('images/PECLogo.png'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                                child: Container(
                                    alignment: Alignment.center,
                                    height: 85.0,
                                    width: title_width,
                                    child: Center(
                                      child: ListTile(
                                        title: Text(
                                            'Documentos em análise',
                                            style: TextStyle(
                                                fontSize: 22.0,
                                                color: Colors.green,
                                                fontFamily: "Poppins-Bold",
                                                letterSpacing: .6)),
                                        leading: Icon(
                                          Icons.hourglass_empty,
                                          color: Colors.green,
                                          size: 22.0,
                                        ),
                                      ),
                                    )

                                  //        )
                                ),
                              ),

                              Column(
                                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10.0, 0.0, 0.0, 0.0),
                                        child: _checkBoxAgendamento(),
                                      ),
                                      SizedBox(
                                        width: 10.0,
                                      ),
                                      Container(
                                        width: a_width,
                                        child: Text(
                                          'Envio da documentação',
                                          style: TextStyle(
                                              color: Colors.grey[700], fontSize: 18.0),
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                        width: b_width,
                                        child: _dataAgendamento(),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 30.0,),

                                  Visibility(
                                    visible: _isVisible,
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 0.0, 0.0, 0.0),
                                          child: _checkBoxEntrevista(),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Container(
                                          width: a_width,
                                          child: Text(
                                            'Data da entrevista',
                                            style: TextStyle(
                                                color: Colors.grey[700], fontSize: 18.0),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: b_width,
                                          child: _dataEntrevista(),
                                        )],
                                    ),
                                  ),
                                  Visibility(
                                      visible: _isVisible,
                                      child: SizedBox(height: 30.0,)),
//                                  Visibility(
//                                    visible: _isVisible,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Padding(
//                                          padding: const EdgeInsets.fromLTRB(
//                                              10.0, 0.0, 0.0, 0.0),
//                                          child: _checkBoxdataProducaoCartao(),
//                                        ),
//                                        SizedBox(
//                                          width: 10.0,
//                                        ),
//                                        Container(
//                                          width: a_width,
//                                          child: Text(
//                                            'Produção do cartão',
//                                            style: TextStyle(
//                                                color: Colors.grey[700], fontSize: 18.0),
//                                          ),
//                                        ),
//                                        Spacer(),
//                                        Container(
//                                          width: b_width,
//                                          child: _dataProducaoCartao(),
//                                        )
//                                      ],
//                                    ),
//                                  ),
//                                  Visibility(
//                                      visible: _isVisible,
//                                      child: SizedBox(height: 30.0,)),
//                                  Visibility(
//                                    visible: _isVisible,
//                                    child: Row(
//                                      children: <Widget>[
//                                        Padding(
//                                          padding: const EdgeInsets.fromLTRB(
//                                              10.0, 0.0, 0.0, 0.0),
//                                          child: _checkBoxdataParaRetirada(),
//                                        ),
//                                        SizedBox(
//                                          width: 10.0,
//                                        ),
//                                        Container(
//                                          width: a_width,
//                                          child: Text(
//                                            'Pronto para retirada',
//                                            style: TextStyle(
//                                                color: Colors.grey[700], fontSize: 18.0),
//                                          ),
//                                        ),
//                                        Spacer(),
//                                        Container(
//                                          width: b_width,
//                                          child: _dataParaRetirada(),
//                                        )
//                                      ],
//                                    ),
//                                  ),
//                                  Visibility(
//                                      visible: _isVisible,
//                                      child: SizedBox(height: 30.0,)),
                                  Visibility(
                                    visible: _isVisible,
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10.0, 0.0, 0.0, 0.0),
                                          child: _checkBoxdataEntregaCartao(),
                                        ),
                                        SizedBox(
                                          width: 10.0,
                                        ),
                                        Container(
                                          width: a_width,
                                          child: Text(
                                            'Cartão entregue',
                                            style: TextStyle(
                                                color: Colors.grey[700], fontSize: 18.0),
                                          ),
                                        ),
                                        Spacer(),
                                        Container(
                                          width: b_width,
                                          child: _dataEntregaCartao(),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Visibility(
                                      visible: _motivoRejeicao,
                                      child: Container(
                                        //width: title_width,
                                        color: Colors.grey[100],
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: <Widget>[
                                            Flexible(
                                              child: Column(
                                                children: <Widget>[
                                                  SizedBox(height: 20.0,),
                                                  Center(
                                                      child: new Icon(Icons.error, size: 50.0, color: Colors.red,)),
                                                  SizedBox(height: 20.0,),
                                                  new Text('Atenção!', style: TextStyle(
                                                      fontSize: 16.0,
                                                      color: Colors.red[600],
                                                      fontFamily: "Poppins-Bold",
                                                      letterSpacing: .6),
                                                  ),
                                                  SizedBox(height: 20.0,),
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: new Text('Motivo da rejeição: ${motivoRejeicao}',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 16.0,
                                                          color: Colors.grey[600],
                                                          fontFamily: "Poppins-Bold",

                                                          letterSpacing: .6),
                                                    ),
                                                  ),

                                                  SizedBox(height: 20.0,),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ))
                                ],
                              ),
                            ],
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: _botaoEscolha(cond)
    );
  }
}