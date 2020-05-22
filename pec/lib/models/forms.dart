class LoginFormData {
  String email = '';
  String password = '';
  String confirmPassword = '';
  String nome = '';
  String rg = '';
  String cpf = '';
  String telefone = '';
  String cep = '';
  String endereco = '';
  String cidade = '';
  String complemento = '';
  String bairro = '';
  String estado = '';


  Map<String, dynamic> toJSON() => {
        'email': email,
        'password': password,
        'confirmPassword': confirmPassword,
        'nome': nome,
        'rg': rg,
        'cpf': cpf,
        'telefone': telefone,
        'cep': cep,
        'endereco': endereco,
        'cidade': cidade,
        'complemento': complemento,
        'bairro': bairro,
        'estado': estado,
      };
}
