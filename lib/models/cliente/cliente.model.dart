import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_fire/models/agendamento/agendamento.model.dart';

class ClienteModel {
  String id;
  String nome;
  int quantidadeCavalos;
  int frequencia;
  String localPadrao;
  String valorDivida;
  DateTime dataUltimoAgendamento;
  DateTime dataProximoAgendamento;
  List<AgendamentoModel> agendamentos;

  ClienteModel({
    this.id,
    this.nome,
    this.quantidadeCavalos,
    this.frequencia,
    this.localPadrao,
    this.valorDivida,
    this.dataUltimoAgendamento,
    this.agendamentos,
  });

  bool get estaDevendo => valorDivida?.isNotEmpty ?? false;

  void atualizarProximoDataAgendamento() {
    if (dataUltimoAgendamento == null) return;
    dataProximoAgendamento =
        dataUltimoAgendamento.add(Duration(days: frequencia));
  }

  ClienteModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nome = json['Nome'];
    quantidadeCavalos = json['QuantidadeCavalos'];
    frequencia = json['Frequencia'];
    localPadrao = json['LocalPadrao'];
    valorDivida = json['ValorDivida'];
    dataUltimoAgendamento = json['DataUltimoAgendamento'];
    dataProximoAgendamento = json['DataProximoAgendamento'];
  }

  ClienteModel.fromMap(DocumentSnapshot document) {
    id = document.documentID;
    nome = document.data['Nome'];
    quantidadeCavalos = document.data['QuantidadeCavalos'];
    frequencia = document.data['Frequencia'];
    localPadrao = document.data['LocalPadrao'];
    valorDivida = document.data['ValorDivida'];
    dataUltimoAgendamento = document.data['DataUltimoAgendamento'];
    dataProximoAgendamento = document.data['DataProximoAgendamento'];
  }

  Map<String, dynamic> toJson() {
    atualizarProximoDataAgendamento();
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nome'] = this.nome;
    data['QuantidadeCavalos'] = this.quantidadeCavalos;
    data['Frequencia'] = this.frequencia;
    data['LocalPadrao'] = this.localPadrao;
    data['ValorDivida'] = this.valorDivida;
    data['DataUltimoAgendamento'] = this.dataUltimoAgendamento;
    data['DataProximoAgendamento'] = this.dataProximoAgendamento;
    data['Agendamentos'] = this.agendamentos.map((x) => x.toJson()).toList();
    return data;
  }
}
