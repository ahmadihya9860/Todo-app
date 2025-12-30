import "package:hive_flutter/hive_flutter.dart";
import "package:project/models/user.dart";

class UserDb {
  static Box<User>? userBox;
  void initBox() async {
    Hive.registerAdapter(UserAdapter());
    await openBox();
  }

  Future<void> openBox() async {
    if (userBox != null) return;

    userBox = await Hive.openBox<User>("userBox");
  }
}
