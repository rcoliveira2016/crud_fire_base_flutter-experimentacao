import 'package:crud_fire/app/model/auth/user_model.dart';
import 'package:crud_fire/app/shared/repository/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'auth_controller.g.dart';

class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AuthRepository _authRepository = Modular.get();

  @observable
  AuthStatus status = AuthStatus.loading;

  @observable
  String error;

  @observable
  UserModel user;

  @action
  setUser(UserModel value) {
    user = value;
    status = user == null ? AuthStatus.logoff : AuthStatus.login;
  }

  _AuthControllerBase() {
    _authRepository.getUser().then(setUser).catchError((e) {
      print('ERRORRRRRR');
    });
  }

  @action
  Future login({
    String email,
    String senha,
  }) async {
    try {
      await _authRepository.getLogin(email: email, senha: senha);
      status = AuthStatus.login;
    } catch (erro) {
      switch (erro.code) {
        case 'ERROR_USER_NOT_FOUND':
          status = AuthStatus.userNotFound;
          break;
        default:
          status = AuthStatus.erro;
      }
    }
  }

  Future logout() {
    return _authRepository.getLogout();
  }
}

enum AuthStatus { loading, login, logoff, erro, userNotFound }
