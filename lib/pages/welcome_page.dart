import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      // التدرج اللوني لخلفية صفحة الترحيب
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.orange],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          transform: GradientRotation(8),
          tileMode: TileMode.repeated,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // الشفافية للحفاظ على التدرج
        appBar: AppBar(backgroundColor: Colors.transparent),
        body: Column(
          children: [
            // صورة الترحيب في الأعلى
            Image.asset("assets/images/welcome_page_image.png", width: 380, cacheWidth: 380,),
            SizedBox(height: 40),

            Center(
              child: Container(
                width: 385,
                height: 300,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: .6), // خلفية البطاقة
                  borderRadius: BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 8),
                      blurRadius: 26,
                      spreadRadius: 4,
                      color: Colors.white.withValues(alpha: .4), // تأثير الظل
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: Center(
                          // نص الترحيب مع جزء ملون
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(text: "Welcome to "),
                                TextSpan(
                                  text: "ToDo ",
                                  style: TextStyle(
                                    color: Colors.orange,
                                  ), // الجزء الملون
                                ),
                                TextSpan(text: "App"),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 32),
                      // زر تسجيل الدخول
                      ActionButton(
                        icon: Icons.login,
                        title: "Sign in",
                        onTap: () {
                          Navigator.pushNamed(context, "/login_page");
                        }, // حدث الضغط على الزر
                      ),
                      SizedBox(height: 24),
                      // زر التسجيل
                      ActionButton(
                        icon: Icons.person_add,
                        title: "Sign Up",
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            "/sign_up_page",
                          ); // الانتقال لصفحة التسجيل
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ويدجيت إعادة الاستخدام للأزرار
class ActionButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final void Function()? onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap, // التعامل مع حدث الضغط
        borderRadius: BorderRadius.circular(25),
        splashColor: Theme.of(context).colorScheme.scrim.withValues(alpha: .6),
        splashFactory: NoSplash.splashFactory,
        child: Ink(
          decoration: BoxDecoration(
            color: Colors.orange.shade400, // لون خلفية الزر
            borderRadius: BorderRadius.circular(25),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // أيقونة دائرية على اليسار
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(icon, color: Colors.orange, size: 33),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: Row(
                    children: [
                      // نص الزر
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 23,
                          color: Theme.of(context).colorScheme.onPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // أيقونة السهم على اليمين
                Icon(
                  Icons.arrow_forward_ios,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
