import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:project/db/user_db.dart';
import 'package:project/models/user.dart';

class UserProvider with ChangeNotifier {
  UserProvider();

  static final Box<User> _users = UserDb.userBox!;

  static get users => _users;

  // add new user
  void addUser(String email, String password) {
    if (email.isNotEmpty && password.isNotEmpty) {
      _users.add(User(email: email, password: password));
    }
    notifyListeners();
  }

  // delete user
  void deleteUser() {
    _users.deleteAt(0);
    notifyListeners();
  }

  // get user
  User? getUser() {
    return _users.get(0);
  }
}
