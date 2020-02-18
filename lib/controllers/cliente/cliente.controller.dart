import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crud_fire/controllers/usuario/usuario.controller.dart';
import 'package:crud_fire/models/cliente/cliente.model.dart';
import 'package:rxdart/rxdart.dart';

class ClienteController {
  final UsuarioController _usuarioController = UsuarioController.instancia;
  CollectionReference _collectionReferenceClientes;

  ClienteController() {
    _collectionReferenceClientes = Firestore.instance
        .collection("usuarios")
        .document(_usuarioController.usuarioLogado.uid)
        .collection('clientes');
  }

  dynamic buscarTodo({String email, String senha}) {
    return Observable(_collectionReferenceClientes.snapshots().map((query) =>
        query.documents
            .map<ClienteModel>((document) => ClienteModel.fromMap(document))
            .toList()));
  }

  void salvar(ClienteModel cliente) async {
    _collectionReferenceClientes
        .add(cliente.toJson())
        .then((onValue) => cliente.agendamentos.forEach(
            (data) => onValue.collection('Agendamento').add(data.toJson())))
        .catchError((err) => print(err));
  }
}
