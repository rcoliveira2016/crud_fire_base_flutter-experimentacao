import 'package:crud_fire/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'agendamento_controller.dart';

class AgendamentoPage extends StatefulWidget {
  final String title;
  const AgendamentoPage({Key key, this.title = "Agendamento"})
      : super(key: key);

  @override
  _AgendamentoPageState createState() => _AgendamentoPageState();
}

class _AgendamentoPageState
    extends ModularState<AgendamentoPage, AgendamentoController> {
  final _controller = Modular.get<AgendamentoController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text("Sair"),
          RaisedButton(
            onPressed: () {
              _controller.deslogar();
            },
            child: Text("data"),
          )
        ],
      ),
    );
  }
}
