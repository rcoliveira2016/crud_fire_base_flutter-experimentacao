import 'package:cloud_firestore/cloud_firestore.dart';

class AgendamentoModel {
  DateTime data;
  int quantidade;
  String valor;

  AgendamentoModel({this.data, this.quantidade, this.valor});

  AgendamentoModel.fromJson(Map<String, dynamic> json) {
    data = json['Data'];
    quantidade = json['quantidade'];
    valor = json['valor'];
  }

  AgendamentoModel.fromDynamic(dynamic json) {
    data = (json['Data'] as Timestamp).toDate();
    quantidade = json['Quantidade'];
    valor = json['Valor'];
  }

  AgendamentoModel.fromMap(DocumentSnapshot document) {
    data = document.data['Data'];
    quantidade = document.data['quantidade'];
    valor = document.data['valor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Data'] = this.data;
    data['quantidade'] = this.quantidade;
    data['valor'] = this.valor;
    return data;
  }
}
