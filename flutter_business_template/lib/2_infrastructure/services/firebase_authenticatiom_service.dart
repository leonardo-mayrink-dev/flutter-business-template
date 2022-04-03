import 'package:flutter_business_template/1_domain/0_entities/app_user.dart';
import 'package:flutter_business_template/1_domain/3_enums/status_enum.dart';
import 'package:flutter_business_template/2_infrastructure/util/message_util.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// Singleton responsável por prover a autenticação do usuário no Firebase.
class FirebaseService {
  static final FirebaseService _singleton = FirebaseService._internal();
  factory FirebaseService() {
    return _singleton;
  }
  FirebaseService._internal();

  /// Instância do Firebase Authentication SDK.
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  /// Retorna o usuário autenticado no aplicativo.
  ///
  /// Retorna [User] ou [null].
  User? get getAuthenticatedUser => _firebaseAuth.currentUser;

  /// Retorna o token do Facebook Authentication SDK.
  Future<String> getFacebookToken() async {
    return await FacebookAuth.instance.accessToken
        .then((value) => value?.token ?? "");
  }

  /// Realiza o logout do Firebase.
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
  }

  /// Realiza a autenticação do usuário utilizando uma credencial de
  /// terceiros (ex. Facebook, Apple ID, Twitter etc).
  Future<UserCredential> _signInWithCredential(
      AuthCredential credential) async {
    UserCredential result =
        await _firebaseAuth.signInWithCredential(credential);
    return result;
  }

  /// Realiza a autenticação do usuário via [email] e [senha] no Firebase.
  ///
  /// Retorna um mapeamento entre o status [Status] da autenticação
  /// do usuário e a sua mensagem [String].
  Future<Status> signInEmail(String email, String senha) async {
    Status retorno = Status.ERROR;
    try {
      UserCredential credential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: senha)
          .catchError((error) {
        MessageUtil.addErrorMessage(error.code.toString());
      });

      if (credential.user?.uid.isNotEmpty ?? false) {
        retorno = Status.SUCCESS;
      }
    } catch (error) {}
    return retorno;
  }

  /// Realiza o cadastro de um novo [usuario] no Firebase.
  /// Caso o cadastro seja realizado com sucesso, é tentada a criação de um
  /// documento na coleção [kColecaoUsuarios] no FireStore Database.
  ///
  /// Retorna um mapeamento entre o status [Status] da criação
  /// do usuário e a sua mensagem [String].
  Future<Status> signUp(AppUser usuario) async {
    Status retorno = Status.ERROR;
    try {
      UserCredential credential = await _firebaseAuth
          .createUserWithEmailAndPassword(
              email: usuario.email, password: usuario.password ?? "")
          .catchError((error) {
        MessageUtil.addErrorMessage(error.code.toString());
      });

      if (credential.user?.uid.isNotEmpty ?? false) {
        retorno = Status.SUCCESS;
      }
    } catch (error) {}
    return retorno;
  }

  /// Envia um e-mail ao usuário para reconfiguração da senha.
  ///
  /// Retorna um mapeamento entre o status [Status] do envio
  /// do e-mail de recuperação e a sua mensagem [String].
  Future<Status> sendPasswordResetEmail(String email) async {
    Status retorno = Status.SUCCESS;
    try {
      await _firebaseAuth
          .sendPasswordResetEmail(email: email)
          .catchError((error) {
        MessageUtil.addErrorMessage(error.code.toString());
        retorno = Status.ERROR;
      });
    } catch (error) {}
    return retorno;
  }

  /// Realiza a autenticação do usuário utilizando uma credencial do Google.
  ///
  /// Retorna um mapeamento entre o status [Status] da autenticação
  /// do usuário e a sua mensagem [String].
  Future<Status> signInWithGoogleCredential() async {
    Status retorno = Status.ERROR;
    try {
      final GoogleSignInAccount? gSignInAcc = await GoogleSignIn().signIn();
      if (gSignInAcc != null) {
        final GoogleSignInAuthentication gSignInAuth =
            await gSignInAcc.authentication;

        final AuthCredential authCredential = GoogleAuthProvider.credential(
          accessToken: gSignInAuth.accessToken,
          idToken: gSignInAuth.idToken,
        );

        UserCredential userCredential =
            await _signInWithCredential(authCredential).catchError((error) {
          MessageUtil.addErrorMessage(error.code.toString());
        });

        if (userCredential.user != null) {
          retorno = Status.SUCCESS;
        }
      }
    } catch (error) {
      MessageUtil.addErrorMessage(error.toString());
    }
    return retorno;
  }

  /// Realiza a autenticação do usuário utilizando uma credencial do Facebook.
  ///
  /// Retorna um mapeamento entre o status [Status] da autenticação
  /// do usuário e a sua mensagem [String].
  Future<Status> signInWithFacebookCredential() async {
    Status retorno = Status.ERROR;
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      String token = result.accessToken?.token ?? "";
      AuthCredential fbCredential = FacebookAuthProvider.credential(token);
      UserCredential? credential;
      try {
        credential =
            await _signInWithCredential(fbCredential).catchError((error) {
          MessageUtil.addErrorMessage(error.code.toString());
        });
      } catch (error) {}

      if (credential?.user?.uid.isNotEmpty ?? false) {
        retorno = Status.SUCCESS;
      }
    }
    return retorno;
  }
}
