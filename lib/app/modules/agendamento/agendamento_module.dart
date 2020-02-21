import 'package:crud_fire/app/modules/agendamento/agendamento_controller.dart';
import 'package:crud_fire/app/modules/agendamento/agendamento_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AgendamentoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AgendamentoController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => AgendamentoPage()),
      ];

  static Inject get to => Inject<AgendamentoModule>.of();
}
