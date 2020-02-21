import 'package:crud_fire/app/init/app_controller.dart';
import 'package:crud_fire/app/init/app_widget.dart';
import 'package:crud_fire/app/modules/agendamento/agendamento_module.dart';
import 'package:crud_fire/app/modules/cliente/cliente_module.dart';
import 'package:crud_fire/app/modules/login/login_module.dart';
import 'package:crud_fire/app/modules/splash/splash_page.dart';
import 'package:crud_fire/app/shared/auth/auth_controller.dart';
import 'package:crud_fire/app/shared/repository/auth/auth_repository.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        Bind((i) => AuthRepository()),
        Bind((i) => AuthController(), singleton: true),
        Bind((i) => AppController()),
      ];

  @override
  List<Router> get routers => [
        Router('/', child: (_, __) => SplashPage()),
        Router('/login', module: LoginModule()),
        Router('/agendamendo', module: AgendamentoModule()),
        Router('/cliente', module: ClienteModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
