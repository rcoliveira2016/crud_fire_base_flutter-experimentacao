import 'package:crud_fire/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  final _authController = Modular.get<AuthController>();

  @observable
  String email;

  @observable
  String senha;

  @observable
  String erro;

  @action
  void setEmail(String email) {
    this.email = email;
  }

  @action
  void setSenha(String senha) {
    this.senha = senha;
  }

  @action
  void logar() {
    _authController
        .login(email: email, senha: senha)
        .then((_) => Modular.to.pushReplacementNamed('/agendamendo'))
        .catchError((_) {
      switch (_authController.status) {
        case AuthStatus.userNotFound:
          erro = "Usuário não encontrado";
          break;
        case AuthStatus.erro:
          erro = "Erro Inesperado";
          break;
        default:
      }
    });
  }

  @action
  void deslogar() {
    _authController
        .logout()
        .then((_) => Modular.to.pushReplacementNamed('/login'));
  }
}
