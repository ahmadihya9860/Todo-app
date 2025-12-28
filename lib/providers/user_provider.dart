import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class UserProvider extends ChangeNotifier {
  final Box userBox;
  UserProvider({required this.userBox});

  String? _usernmae;
  String? _email;
  bool _isloggedIn = false;

  String? get username => _usernmae;
  String? get email => _email;
  bool? get isloggesIn => _isloggedIn;


//  log in
  void logIn({required String name, required String email}) {
    userBox.put("name", name);
    userBox.put("email", email);

    _usernmae = name;
    _email = email;
    _isloggedIn = true;

    notifyListeners();
  }


//  log out 
  void logout() {
    userBox.clear();

    _usernmae = null;
    _email = null;
    _isloggedIn = false;
    notifyListeners();
  }
}
