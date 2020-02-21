import 'package:crud_fire/app/modules/cliente/cliente_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ClienteModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router('/', child: (_, args) => ClientePage()),
      ];

  static Inject get to => Inject<ClienteModule>.of();
}
