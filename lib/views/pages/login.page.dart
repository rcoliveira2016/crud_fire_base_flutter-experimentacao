import 'package:crud_fire/controllers/usuario/usuario.controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  String email;
  String senha;

  String error;
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final UsuarioController _controller = UsuarioController.instancia;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teste Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              onChanged: (value) {
                setState(() {
                  widget.email = value;
                });
              },
              decoration:
                  InputDecoration(border: InputBorder.none, labelText: 'email'),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              obscureText: true,
              onChanged: (value) {
                setState(() {
                  widget.senha = value;
                });
              },
              decoration:
                  InputDecoration(border: InputBorder.none, labelText: 'senha'),
            ),
            widget.error != null
                ? Text(
                    "${widget.error}",
                    style: TextStyle(color: Colors.red, fontSize: 15),
                  )
                : SizedBox(),
            RaisedButton(
              onPressed: () {
                print(widget.email);
                _controller.logar(
                    email: widget.email,
                    senha: widget.senha,
                    onSucesso: () =>
                        Navigator.pushReplacementNamed(context, "/home"),
                    onUsuarioNaoEncontrado: () =>
                        setState(() => widget.error = "Usuário não encontrado"),
                    onError: () =>
                        setState(() => widget.error = "Erro inesperado"));
              },
              child: Text("Entrar"),
            )
          ],
        ),
      ),
    );
  }
}
