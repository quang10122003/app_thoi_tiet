import 'package:firebase_auth/firebase_auth.dart';
class AuthResult {
  final User? user;
  final String? errorMessage;

  AuthResult({this.user, this.errorMessage});
}

class firebaseService {
  FirebaseAuth _auth = FirebaseAuth.instance;

// dang ky
  Future<AuthResult> registerUserWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      return AuthResult(user: user);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return AuthResult(
            errorMessage: 'Địa chỉ email đã được sử dụng bởi tài khoản khác.');
      } else {
        print('Lỗi tạo người dùng: $e');
        return AuthResult(errorMessage: 'Có lỗi xảy ra khi tạo người dùng.');
      }
    } catch (e) {
      print('Lỗi tạo người dùng: $e');
      return AuthResult(errorMessage: 'Có lỗi xảy ra khi tạo người dùng.');
    }
  }

  // dang nhap
  Future<AuthResult> loginUserWithEmailPassword(
      String email, String password) async {
    try {
      UserCredential credential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User user = credential.user!;
      return AuthResult(user: user);
    }catch (e) {
      print('Lỗi đăng nhập: $e');
      return AuthResult(errorMessage: 'tài khoản hoặc mật khẩu không chính xác.');
    }
  }
  Future<String?> getUidByEmail(String email) async {
    try {
      // Gọi hàm để lấy thông tin người dùng từ Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: 'password', // Mật khẩu không quan trọng, chỉ cần email để đăng nhập
      );

      // Trả về UID của người dùng
      return userCredential.user!.uid;
    } catch (e) {
      // Xử lý lỗi nếu có
      print('Error getting UID by email: $e');
      return null;
    }
  }
}
