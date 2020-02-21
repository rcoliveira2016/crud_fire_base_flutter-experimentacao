import 'package:crud_fire/app/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'login_controller.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = "Login"}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends ModularState<LoginPage, LoginController> {
  final _controller = Modular.get<LoginController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: _controller.setEmail,
              decoration:
                  InputDecoration(border: InputBorder.none, labelText: 'email'),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              obscureText: true,
              onChanged: _controller.setSenha,
              decoration:
                  InputDecoration(border: InputBorder.none, labelText: 'senha'),
            ),
            Observer(
              builder: (_) => Text(
                '${_controller.erro}',
                style: const TextStyle(fontSize: 20),
              ),
            ),
            RaisedButton(
              onPressed: () {
                _controller.logar();
              },
              child: Text("Entrar"),
            )
          ],
        ),
      ),
    );
  }
}
