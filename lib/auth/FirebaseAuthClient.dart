import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pokemon_quiz_app/data/model/FirebaseAuthResultStatus.dart';

class FirebaseAuthClient {
  static Future<FirebaseAuthResultStatus> login(
      String email, String password) async {
    FirebaseAuthResultStatus result;
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        result = FirebaseAuthResultStatus.Undefined;
      } else {
        result = FirebaseAuthResultStatus.Successful;
      }
    } catch (error) {
      print("error: ${(error as FirebaseAuthException).code}");
      result = handleException(error as FirebaseAuthException);
    }
    return result;
  }

  static Future<FirebaseAuthResultStatus> register(
      String email, String password) async {
    FirebaseAuthResultStatus result;
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      if (userCredential.user == null) {
        result = FirebaseAuthResultStatus.Undefined;
      } else {
        result = FirebaseAuthResultStatus.Successful;
      }
      FirebaseFirestore.instance
          .collection("users")
          .doc(userCredential.user!.uid)
          .set({
        "created_at": DateTime.now().millisecondsSinceEpoch,
        "name": "",
        "email": email,
        "photoURL": ""
      });
    } catch (error) {
      print("error: $error");
      result = handleException(error as FirebaseAuthException);
    }
    return result;
  }

  static FirebaseAuthResultStatus handleException(FirebaseAuthException e) {
    FirebaseAuthResultStatus result;
    switch (e.code) {
      case 'invalid-email':
        result = FirebaseAuthResultStatus.InvalidEmail;
        break;

      case 'invalid-credential':
        result = FirebaseAuthResultStatus.InvalidCredential;
        break;

      case 'wrong-password':
        result = FirebaseAuthResultStatus.WrongPassword;
        break;

      case 'user-not-found':
        result = FirebaseAuthResultStatus.UserNotFound;
        break;

      case 'user-disabled':
        result = FirebaseAuthResultStatus.UserDisabled;
        break;

      case 'too-many-requests':
        result = FirebaseAuthResultStatus.TooManyRequests;
        break;

      case 'operation-not-allowed':
        result = FirebaseAuthResultStatus.OperationNotAllowed;
        break;

      case 'email-already-in-use':
        result = FirebaseAuthResultStatus.EmailAlreadyExists;
        break;

      default:
        result = FirebaseAuthResultStatus.Undefined;
        break;
    }
    return result;
  }

  static String exceptionMessage(FirebaseAuthResultStatus result) {
    String message = '';
    switch (result) {
      case FirebaseAuthResultStatus.Successful:
        message = '';
        break;
      case FirebaseAuthResultStatus.InvalidEmail:
        message = 'メールアドレスが間違っています。';
        break;

      case FirebaseAuthResultStatus.InvalidCredential:
        message = '認証情報が間違っています。';
        break;

      case FirebaseAuthResultStatus.WrongPassword:
        message = 'パスワードが間違っています。';
        break;

      case FirebaseAuthResultStatus.UserNotFound:
        message = 'このアカウントは存在しません。';
        break;

      case FirebaseAuthResultStatus.UserDisabled:
        message = 'このメールアドレスは無効になっています。';
        break;

      case FirebaseAuthResultStatus.TooManyRequests:
        message = '回線が混雑しています。もう一度試してみてください。';
        break;

      case FirebaseAuthResultStatus.OperationNotAllowed:
        message = 'メールアドレスとパスワードでのログインは有効になっていません。';
        break;

      case FirebaseAuthResultStatus.EmailAlreadyExists:
        message = 'このメールアドレスはすでに登録されています。';
        break;

      default:
        message = '予期せぬエラーが発生しました。';
        break;
    }
    return message;
  }
}
