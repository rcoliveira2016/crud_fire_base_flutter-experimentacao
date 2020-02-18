import 'package:crud_fire/models/usuario/usuario.model.dart';
import 'package:firebase_auth/firebase_auth.dart';

typedef LoginCallback = void Function();

class UsuarioController {
  UsuarioController._();
  static final UsuarioController instancia = UsuarioController._();

  final _auth = FirebaseAuth.instance;

  UsuarioModel usuarioLogado;
  var _statusLogado = StatusLogin.naoIniciado;

  StatusLogin get statusLogado => _statusLogado;

  void logar({
    String email,
    String senha,
    LoginCallback onSucesso,
    LoginCallback onUsuarioNaoEncontrado,
    LoginCallback onError,
  }) {
    _statusLogado = StatusLogin.iniciado;
    _auth.signInWithEmailAndPassword(email: email, password: senha).then((_) {
      _statusLogado = StatusLogin.logado;
      onSucesso();
    }).catchError((error) {
      switch (error.code) {
        case 'ERROR_USER_NOT_FOUND':
          _statusLogado = StatusLogin.usuarioNaoEncontrado;
          onUsuarioNaoEncontrado();
          break;
        default:
          _statusLogado = StatusLogin.erroLogin;
          onError();
      }
    });
  }

  Future<StatusLogin> obterUsuarioLogado() async {
    _statusLogado = StatusLogin.iniciado;
    var currentUser = await _auth.currentUser();
    setarUsuarioLogado(currentUser);
    _statusLogado =
        usuarioLogado == null ? StatusLogin.deslogado : StatusLogin.logado;

    return _statusLogado;
  }

  Future deslogar() {
    return _auth.signOut();
  }

  void setarUsuarioLogado(FirebaseUser user) {
    if (user == null) return;
    usuarioLogado = UsuarioModel(
      email: user.email,
      login: user.email,
      nome: user.displayName,
      uid: user.uid,
      urlPerfil: user.photoUrl,
    );
  }
}

enum StatusLogin {
  naoIniciado,
  iniciado,
  logado,
  usuarioNaoEncontrado,
  erroLogin,
  deslogado
}
