class UsuarioModel {
  String uid;
  String nome;
  String login;
  String senha;
  String email;
  String urlPerfil;
  bool ativo;

  UsuarioModel({
    this.uid,
    this.nome,
    this.login,
    this.senha,
    this.email,
    this.ativo,
    this.urlPerfil,
  });

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    nome = json['Nome'];
    login = json['Login'];
    senha = json['Senha'];
    email = json['Email'];
    ativo = json['Ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['Nome'] = this.nome;
    data['Login'] = this.login;
    data['Senha'] = this.senha;
    data['Email'] = this.email;
    data['Ativo'] = this.ativo;
    return data;
  }
}
