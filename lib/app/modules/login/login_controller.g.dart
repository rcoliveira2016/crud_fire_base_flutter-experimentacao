// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginControllerBase, Store {
  final _$emailAtom = Atom(name: '_LoginControllerBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$senhaAtom = Atom(name: '_LoginControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.context.enforceReadPolicy(_$senhaAtom);
    _$senhaAtom.reportObserved();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.context.conditionallyRunInAction(() {
      super.senha = value;
      _$senhaAtom.reportChanged();
    }, _$senhaAtom, name: '${_$senhaAtom.name}_set');
  }

  final _$erroAtom = Atom(name: '_LoginControllerBase.erro');

  @override
  String get erro {
    _$erroAtom.context.enforceReadPolicy(_$erroAtom);
    _$erroAtom.reportObserved();
    return super.erro;
  }

  @override
  set erro(String value) {
    _$erroAtom.context.conditionallyRunInAction(() {
      super.erro = value;
      _$erroAtom.reportChanged();
    }, _$erroAtom, name: '${_$erroAtom.name}_set');
  }

  final _$_LoginControllerBaseActionController =
      ActionController(name: '_LoginControllerBase');

  @override
  void setEmail(String email) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setEmail(email);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSenha(String senha) {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.setSenha(senha);
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void logar() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.logar();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deslogar() {
    final _$actionInfo = _$_LoginControllerBaseActionController.startAction();
    try {
      return super.deslogar();
    } finally {
      _$_LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},senha: ${senha.toString()},erro: ${erro.toString()}';
    return '{$string}';
  }
}
