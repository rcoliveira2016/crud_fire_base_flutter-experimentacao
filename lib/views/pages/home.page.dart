import 'package:crud_fire/controllers/cliente/cliente.controller.dart';
import 'package:crud_fire/controllers/usuario/usuario.controller.dart';
import 'package:crud_fire/models/agendamento/agendamento.model.dart';
import 'package:crud_fire/models/cliente/cliente.model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  var txtNome = TextEditingController();
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final UsuarioController _controller = UsuarioController.instancia;
  final ClienteController _clienteController = new ClienteController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              controller: widget.txtNome,
              decoration: InputDecoration(labelText: "Nome"),
            ),
            Divider(
              color: Colors.red,
              height: 2,
            ),
            RaisedButton(
              onPressed: () {
                _controller.deslogar().then(
                    (_) => Navigator.pushReplacementNamed(context, "/login"));
              },
              child: Text("Sair"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            _clienteController.salvar(ClienteModel(
              frequencia: 5,
              id: "1111",
              localPadrao: "uaua",
              nome: widget.txtNome.text,
              quantidadeCavalos: 4,
              valorDivida: "131313,12",
              dataUltimoAgendamento: DateTime.now(),
              agendamentos: <AgendamentoModel>[
                AgendamentoModel(
                    data: DateTime.now(), valor: "1414141", quantidade: 0),
                AgendamentoModel(
                    data: DateTime.now(), valor: "1414141", quantidade: 0),
                AgendamentoModel(
                    data: DateTime.now(), valor: "1414141", quantidade: 0),
                AgendamentoModel(
                    data: DateTime.now(), valor: "1414141", quantidade: 0),
                AgendamentoModel(
                    data: DateTime.now(), valor: "1414141", quantidade: 0),
                AgendamentoModel(
                    data: DateTime.now(), valor: "1414141", quantidade: 0),
              ],
            ));
          }),
    );
  }
}
