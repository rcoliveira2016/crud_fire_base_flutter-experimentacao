import 'package:crud_fire/app/modules/login/login_controller.dart';
import 'package:crud_fire/app/shared/auth/auth_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'agendamento_controller.g.dart';

class AgendamentoController = _AgendamentoControllerBase
    with _$AgendamentoController;

abstract class _AgendamentoControllerBase with Store {
  final _controller = Modular.get<AuthController>();

  @observable
  int value = 0;

  @action
  void deslogar() {
    _controller.logout().then((_) => Modular.to.pushReplacementNamed('/login'));
  }
}
