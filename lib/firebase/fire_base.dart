import 'package:cloud_firestore/cloud_firestore.dart';
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
  Future<String> getUidByEmail(String email) async {
    try {
      // Gọi hàm để lấy thông tin người dùng từ Firebase Auth
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: 'password', // Mật khẩu không quan trọng, chỉ cần email để đăng nhập
      );

      // Trả về UID của người dùng
      print(userCredential.user!.uid);
      return userCredential.user!.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Xử lý khi không tìm thấy người dùng với email đã nhập
        print('User not found with email: $email');
      } else {
        // Xử lý lỗi khác nếu có
        print('Error getting UID by email: $e');
      }
      // Trả về một giá trị mặc định hoặc xử lý ngoại lệ
      throw Exception('Failed to get UID by email');
    }
  }

  Future<void> addFavoriteCity_login(String newCityName) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      // Lấy dữ liệu hiện tại từ Firestore
      DocumentSnapshot snapshot = await _firestore.collection('favorite_cities').doc("2").get();

      // Ép kiểu dữ liệu của snapshot.data() thành Map<String, dynamic>
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      // Kiểm tra xem data có null không và có chứa 'city_name' không
      if (data != null && data.containsKey('city_name')) {
        // Lấy danh sách thành phố từ dữ liệu Firestore
        List<String> currentCities = List.from(data['city_name'] as List<dynamic>);

        // Thêm thành phố mới vào cuối danh sách
        currentCities.add(newCityName);

        // Cập nhật tài liệu Firestore với danh sách thành phố mới
        await _firestore.collection('favorite cities').doc("1").update({
          'city_name': currentCities,
        });
      } else {
        // Nếu data là null hoặc không chứa 'city_name', tạo một danh sách mới và thêm thành phố mới vào đó
        List<String> currentCities = [newCityName];

        // Cập nhật tài liệu Firestore với danh sách thành phố mới
        await _firestore.collection('favorite cities').doc("1").set({
          'city_name': currentCities,
        });
      }
    } catch (e) {
      print('Failed to add favorite city: $e');
    }
  }
  Future<void> update(String newCityName , String email) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      // Lấy dữ liệu hiện tại từ Firestore
      DocumentSnapshot snapshot = await _firestore.collection('favorite cities').doc(email).get();

      // Ép kiểu dữ liệu của snapshot.data() thành Map<String, dynamic>
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      // Khởi tạo một danh sách mới nếu data là null hoặc không chứa 'city_name'
      List<String> currentCities = data != null && data.containsKey('city name') ? List.from(data['city name'] as List<dynamic>) : [];

      // Thêm thành phố mới vào cuối danh sách
      currentCities.add(newCityName);

      // Cập nhật tài liệu Firestore với danh sách thành phố mới
      await _firestore.collection('favorite cities').doc(email).set({
        'city name': currentCities,
      }, SetOptions(merge: true)); // Sử dụng SetOptions với merge: true để cập nhật (merge) thay vì ghi đè (overwrite)
    } catch (e) {
      print('Failed to add favorite city: $e');
    }
  }

  Future<void> taomoi(String email) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    try {
      // Lấy dữ liệu hiện tại từ Firestore
      DocumentSnapshot snapshot = await _firestore.collection('favorite cities').doc(email).get();

      // Ép kiểu dữ liệu của snapshot.data() thành Map<String, dynamic>
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      // Khởi tạo một danh sách mới nếu data là null hoặc không chứa 'city_name'
      List<String> currentCities =  [];

      // Cập nhật tài liệu Firestore với danh sách thành phố mới
      await _firestore.collection('favorite cities').doc(email).set({
        'city name': currentCities,
      }, SetOptions(merge: true)); // Sử dụng SetOptions với merge: true để cập nhật (merge) thay vì ghi đè (overwrite)
    } catch (e) {
      print('Failed to add favorite city: $e');
    }
  }
  Future<List<String>> getAllCitiesByEmail(String email) async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    List<String> allCities = [];

    try {
      // Lấy dữ liệu từ Firestore
      DocumentSnapshot snapshot = await _firestore.collection('favorite cities').doc(email).get();

      // Ép kiểu dữ liệu của snapshot.data() thành Map<String, dynamic>
      Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

      // Kiểm tra xem tài liệu có tồn tại không
      if (snapshot.exists && data != null && data.containsKey('city name')) {
        // Lấy dữ liệu thành phố từ trường 'city_name'
        List<dynamic> cityNames = data['city name'];

        // Kiểm tra nếu danh sách cityNames rỗng
        if (cityNames.isNotEmpty) {
          // Thêm tất cả tên thành phố vào danh sách allCities
          allCities.addAll(List<String>.from(cityNames));
        }
        // Nếu danh sách cityNames rỗng, trả về list rỗng
      }
    } catch (e) {
      print('Failed to get all cities for $email: $e');
    }
    print(allCities);
    return allCities;
  }



}
