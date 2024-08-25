import '../db/database_helper.dart';

class AuthService {
  Future<bool> authenticateUser(String email, String password) async {
    final user = await DatabaseHelper.instance.getUserByEmail(email);
    // Cek jika user ditemukan dan password cocok
    return user != null && user.password == password;
  }
}
