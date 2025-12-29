import 'package:flutter/material.dart';
import 'package:project/db/user_db.dart';
import 'package:project/pages/home_page.dart';
import 'package:project/pages/login_screen.dart';
import 'package:project/pages/settings_page.dart';
import 'package:project/pages/sign_up_page.dart';
import 'package:project/pages/tasks_page.dart';
import 'package:project/pages/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:project/providers/user_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  UserDb().initBox();
  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => UserProvider())],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // إزالة شعار الـ debug
      home: WelcomePage(), // الصفحة الرئيسية عند فتح التطبيق
      routes: {
        // تعريف جميع الصفحات في التطبيق
        "/home_page": (_) => HomePage(),
        "welcome_page": (_) => WelcomePage(),
        "/sign_up_page": (_) => SignUpPage(),
        "/login_page": (_) => LoginScreen(),
        "/tasks_page": (_) => TasksPage(),
        "/settings_page": (_) => SettingsPage(),
      },
    );
  }
}
