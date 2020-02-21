class UserModel {
  String uid;
  String nome;
  String email;
  String urlPerfil;
  bool ativo;

  UserModel({this.uid, this.nome, this.email, this.urlPerfil, this.ativo});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    nome = json['Nome'];
    email = json['Email'];
    urlPerfil = json['UrlPerfil'];
    ativo = json['Ativo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['Nome'] = this.nome;
    data['Email'] = this.email;
    data['UrlPerfil'] = this.urlPerfil;
    data['Ativo'] = this.ativo;
    return data;
  }
}
