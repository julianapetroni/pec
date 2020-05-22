import 'package:flutter/material.dart';

import 'appBarPEC.dart';

class RegrasEmissao extends StatelessWidget {
  Widget build(BuildContext context) {
    double a_width = MediaQuery.of(context).size.width*0.9;
    return Scaffold(
      appBar: AppBarPEC(
        title: Text(' '),
      ),
      endDrawer: MyDrawer(),
      backgroundColor: Colors.white,
      body: SafeArea(
          child: ListView(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
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
                padding: const EdgeInsets.only(left: 30.0, top: 10.0),
                child: Text("Regras para emissão",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 22.0,
                            color: Colors.green,
                            fontFamily: "Poppins-Bold",
                            letterSpacing: .6)),

              ),
              SizedBox(
                height: 30.0,
              ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: <Widget>[
              Container(
                width: a_width,
                child: new ExpansionTile(
                    title: Text('PEC ESCOLAR 50% OU REVALIDAÇÃO',
                      style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[700],
                          fontFamily: "Poppins-Bold",
                          letterSpacing: .4),),

                    children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                            child: new Column(
                              children: <Widget>[

                                SizedBox(height: 20.0,),
                                Row(children: <Widget>[
                                  Flexible(
                                      child: Container(

                                          child: Text('Serviço tarifado.'
                                              '\n\nAluno ou Professor devem estar presentes para captura de foto para o sistema.'
                                              '\n\nA distância da residência até a escola deverá ser superior a 1 KM.'
                                              '\n\nTrazer documentos originais no dia da entrevista.',
                                            textAlign: TextAlign.justify,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors.grey[700],
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .4),
                                          ))),
                                ],),
                                SizedBox(height: 20.0,),
                                new ExpansionTile(
                                  title: new Text('Para aluno:',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .4),),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: new Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Foto: Cartão Escolar (Caso seja Revalidação)',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Foto: Declaração escolar do semestre atual carimbada e assinada',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Foto:  RG e CPF ou Certidão de Nascimento',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Foto: Comprovante de endereço nominal ou dos pais (Validade 03 meses)',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Documentos Válidos Contas: Água / Luz / Telefone Fixo / Fatura de Cartão de Crédito',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Não serão aceitos comprovantes: TV a Cabo / Internet ou Telefonia Móvel e Outros Não Relacionados Acima',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Para residências alugadas: Foto do Contrato de aluguel + Comprovante em nome do locador'
                                                        '\nCaso contrário o locador terá que declarar em cartório que o locatário reside no endereço informado'
                                                        '\n(Anexar comprovante de endereço em nome do locatário)',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Para alunos menores de 18 anos que não moram com os pais, trazer foto da guarda ou tutela',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Somente para alunos de ensino fundamental, médio, técnico e superior',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                new ExpansionTile(
                                  title: new Text('Para professor:',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey[700],
                                        fontFamily: "Poppins-Bold",
                                        letterSpacing: .4),),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: new Column(
                                        children: <Widget>[
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Foto: Cartão Escolar (Caso seja Revalidação)',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Foto:  RG e CPF',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Foto: Comprovante de endereço nominal ou dos pais (Validade 03 meses)',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Documentos Validos Contas: Água / Luz / Telefone Fixo / Fatura de Cartão de Crédito',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Não serão aceitos comprovantes: TV a Cabo / Internet ou Telefonia Móvel e Outros Não Relacionados Acima',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Para residências alugadas: Foto do Contrato de aluguel + Comprovante em nome do locador'
                                                        '\nCaso contrário o locador terá que declarar em cartório que o locatário reside no endereço informado'
                                                        '\n(Anexar comprovante de endereço em nome do locatário)',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Declaração como professor do semestre atual carimbada e assinada pela instituição',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Holerite da mesma instituição (Validade 03 meses)',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                          Row(
                                            children: <Widget>[
                                              Flexible(
                                                  child: ListTile(
                                                    leading: Icon(Icons.check),
                                                    title: Text('Caso não tenha, trazer declaração com a observação (Professor não possui holerite)',
                                                      textAlign: TextAlign.justify,
                                                      style: TextStyle(
                                                          fontSize: 14.0,
                                                          color: Colors.grey[700],
                                                          fontFamily: "Poppins-Bold",
                                                          letterSpacing: .4),
                                                    ),
                                                  )),
                                            ],
                                          ),

                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )

                    ],
                  ),
              ),
              Container(
                width: a_width,
                child: new ExpansionTile(
                  title: Text('PEC PASSE LIVRE OU REVALIDAÇÃO',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .4),),

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                      child: new Column(
                        children: <Widget>[

                          SizedBox(height: 20.0,),
                          Row(children: <Widget>[
                            Flexible(
                                child: Container(

                                    child: Text('Serviço tarifado.'
                                        '\n\nAlunos com bolsa e em escola particular não têm direito ao benefício.'
                                        '\n\nO aluno deve estar presente para captura de foto para o sistema.'
                                        '\n\nA distância da residência até a escola deverá ser superior a 2 KM.'
                                        '\n\nTrazer documentos originais no dia da entrevista.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ))),
                          ],),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Cartão Passe Livre (Caso seja Revalidação)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Frequência escolar (Caso seja Revalidação)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Declaração escolar do semestre atual carimbada e assinada',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto:  RG e CPF ou Certidão de Nascimento',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Comprovante de endereço nominal ou dos pais (Validade 03 meses)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Documentos Validos Contas: Água / Luz / Telefone Fixo / Fatura de Cartão de Crédito',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Não serão aceitos comprovantes: TV a Cabo / Internet ou Telefonia Móvel e Outros Não Relacionados Acima',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Para residências alugadas: Foto do Contrato de aluguel + Comprovante em nome do locador'
                                        '\nCaso contrário o locador terá que declarar em cartório que o locatário reside no endereço informado'
                                        '\n(Anexar comprovante de endereço em nome do locatário)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Para alunos menores de 18 anos que não moram com os pais, trazer foto da guarda ou tutela',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Fotos do comprovante de renda familiar de todos que residem com o aluno, quem trabalha (Holerite)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('No caso de desempregado, carteira de profissional as seguintes Fotos (Páginas Nome e Foto, último registro e próxima folha em branco)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Para autônomo foto da declaração de renda juntamente com a carteira profissional)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Para beneficiários do INSS foto do extrato com o valor do benefício e carteira profissional',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('O Rendimento familiar não pode ultrapassar 2 salários mínimos (Não e per capita)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Certidão de divórcio (Para pais separados)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Rg da mãe',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('No caso de alunos com “FIES” E PRONATEC foto do contrato, alunos com contrato a mais de 2 anos foto do aditamento do semestre passado',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Para alunos PROUNI, foto: Termo de concessão de bolsa',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Container(
                width: a_width,
                child: new ExpansionTile(
                  title: Text('BILHETE ÚNICO MUNICIPAL',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .4),),

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                      child: new Column(
                        children: <Widget>[

                          SizedBox(height: 20.0,),
                          Row(children: <Widget>[
                            Flexible(
                                child: Container(

                                    child: Text('Serviço tarifado.',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ))),
                          ],),
                          SizedBox(height: 20.0,),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto:  RG, CPF ou Certidão de nascimento',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Comprovante de endereço',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Container(
                width: a_width,
                child: new ExpansionTile(
                  title: Text('PEC ESPECIAL',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .4),),

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                      child: new Column(
                        children: <Widget>[

                          SizedBox(height: 20.0,),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Cartão Especial (Caso seja Revalidação)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto:  RG e CPF ou Certidão de Nascimento',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Cartão SUS (Verso)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Comprovante de endereço nominal ou dos pais (Validade 03 meses)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Documentos Validos Contas: Agua / Luz / Telefone Fixo / Fatura de Cartão de Credito',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Laudo médico do SUS (Validade 03 meses)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Ressonância se tiver (Para pacientes de ortopedia)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Receita medica da mesma data que o laudo (Para pacientes de psiquiatria)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Comprovante de renda familiar do paciente (Não pode ultrapassar 3 salários mínimos)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Declaração escolar (Caso estude)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Rg do acompanhante (Sujeito analise)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Container(
                width: a_width,
                child: new ExpansionTile(
                  title: Text('FREQUÊNCIA PASSE LIVRE (ABRIL / OUTUBRO)',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .4),),

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                      child: new Column(
                        children: <Widget>[

                          SizedBox(height: 20.0,),
                          Row(children: <Widget>[
                            Flexible(
                                child: Container(

                                    child: Text('Entre os dias 01 á 30 de Abril a ficha de frequência deverá estar carimbada os meses de Fevereiro /Março/Abril'
                                        '\nEntre os dias 01 á 31 de Outubro ficha de frequência deverá estar carimbada os meses de Agosto/Setembro/Outubro ',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ))),
                          ],),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Cartão Passe Livre (Caso seja Revalidação)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Frequência escolar (Caso seja Revalidação)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Container(
                width: a_width,
                child: new ExpansionTile(
                  title: Text('PEC SENIOR',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .4),),

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                      child: new Column(
                        children: <Widget>[

                          SizedBox(height: 20.0,),
                          Row(children: <Widget>[
                            Flexible(
                                child: Container(

                                    child: Text('Somente a partir de 63 anos de idade.'
                                      '\nPara moradores do município de Carapicuíba',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ))),
                          ],),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto:  RG e CPF ou Certidão de Nascimento',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Comprovante de endereço nominal (Validade 03 meses)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    )

                  ],
                ),
              ),
              Container(
                width: a_width,
                child: new ExpansionTile(
                  title: Text('PEC GESTANTE',
                    style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[700],
                        fontFamily: "Poppins-Bold",
                        letterSpacing: .4),),

                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 30.0, right: 15.0),
                      child: new Column(
                        children: <Widget>[

                          SizedBox(height: 20.0,),
                          Row(children: <Widget>[
                            Flexible(
                                child: Container(

                                    child: Text('Concedido após o 4º Mês de gestação',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ))),
                          ],),
                          Row(
                            children: <Widget>[
                              Flexible(
                                      child: ListTile(
                                        leading: Icon(Icons.check),
                                        title: Text('Foto: RG e CPF',
                                          textAlign: TextAlign.justify,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: Colors.grey[700],
                                              fontFamily: "Poppins-Bold",
                                              letterSpacing: .4),
                                        ),
                                      )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Comprovante de endereço nominal ou dos pais (Validade 03 meses) ',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Flexible(
                                  child: ListTile(
                                    leading: Icon(Icons.check),
                                    title: Text('Foto: Cartão Pré-natal páginas (Nome, Idade gestacional e data prevista do parto)',
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.grey[700],
                                          fontFamily: "Poppins-Bold",
                                          letterSpacing: .4),
                                    ),
                                  )),
                            ],
                          ),


                        ],
                      ),
                    )

                  ],
                ),
              ),
            ],
          ),
        ),
    ])));
  }
}
