import 'package:crud_fire/controllers/usuario/usuario.controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final UsuarioController _controller = UsuarioController.instancia;
  void initState() {
    _controller.obterUsuarioLogado().then((_) {
      if (_controller.statusLogado == StatusLogin.logado) {
        Navigator.pushReplacementNamed(context, "/home");
      } else {
        Navigator.pushReplacementNamed(context, "/login");
      }
    }).catchError((onError) => print('erro'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Demo"),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Aguardando..."),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
