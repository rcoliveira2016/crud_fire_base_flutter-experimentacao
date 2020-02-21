import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cliente_controller.dart';

class ClientePage extends StatefulWidget {
  final String title;
  const ClientePage({Key key, this.title = "Cliente"}) : super(key: key);

  @override
  _ClientePageState createState() => _ClientePageState();
}

class _ClientePageState extends ModularState<ClientePage, ClienteController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
