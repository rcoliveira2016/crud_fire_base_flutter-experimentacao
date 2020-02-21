import 'package:crud_fire/app/model/auth/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthRepository extends Disposable {
  final _auth = FirebaseAuth.instance;

  Future<UserModel> getUser() async {
    var user = await _auth.currentUser();
    return setUser(user);
  }

  Future getLogout() {
    return _auth.signOut();
  }

  Future getLogin({
    String email,
    String senha,
  }) {
    return _auth.signInWithEmailAndPassword(email: email, password: senha);
  }

  UserModel setUser(FirebaseUser user) {
    if (user == null) return null;
    return UserModel(
      nome: user.displayName,
      ativo: true,
      email: user.email,
      uid: user.uid,
      urlPerfil: user.photoUrl,
    );
  }

  @override
  void dispose() {}
}
