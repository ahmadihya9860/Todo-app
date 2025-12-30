import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/widgets/login_form.dart';
import 'package:project/widgets/social_media_buttons.dart';

// صفحة تسجيل الدخول الرئيسية
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // مفتاح للتحقق من صحة الفورم
  TextEditingController emailController = TextEditingController(); // التحكم بحقل البريد الإلكتروني
  TextEditingController passwordController = TextEditingController(); // التحكم بحقل كلمة المرور

  @override
  void dispose() {
    // تحرير الموارد عند التخلص من الصفحة
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // الخلفية المتدرجة للصفحة
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade700, Colors.orange.shade300],
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          transform: GradientRotation(8),
          tileMode: TileMode.repeated,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // السماح برؤية الخلفية
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.white), // لون أيقونات العودة
        ),
        body: Column(
          children: [
            // الجزء العلوي Header باستخدام Glassmorphism
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                color: Colors.white.withOpacity(0.2), // خلفية شبه شفافة
                height: 150,
                width: double.infinity,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // تأثير ضبابية الخلفية
                    ClipRRect(
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
                        enabled: true,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.3),
                                offset: Offset(0, 1),
                                blurStyle: BlurStyle.inner,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // نص الترحيب الرئيسي
                    Positioned(
                      top: 20,
                      child: Text(
                        "Welcome Back",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // نص توضيحي
                    Positioned(
                      top: 80,
                      child: Text(
                        "Sign in to your account",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // حاوية الفورم الرئيسية
            Container(
              width: 380,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.75), // خلفية شبه شفافة
                borderRadius: BorderRadius.circular(14),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 26,
                    blurStyle: BlurStyle.inner,
                    color: Colors.white.withOpacity(0.4), // تأثير الظل الداخلي
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(22.0),
                child: LoginForm(
                  formKey: _formKey, // تمرير مفتاح الفورم
                  emailController: emailController, // تمرير المتحكم بحقل البريد
                  passwordController: passwordController, // تمرير المتحكم بحقل كلمة المرور
                ),
              ),
            ),

            const SizedBox(height: 16),

            // قسم تسجيل الدخول باستخدام الشبكات الاجتماعية
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // ضبابية خلفية الحاوية
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Container(
                    height: 80,
                    width: 400,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.6), // خلفية شبه شفافة
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // زر تسجيل الدخول عبر Google
                        socialMediaButtons(
                          image: Image.asset("assets/images/google.png"),
                          onTap: () => debugPrint("google"),
                        ),
                        // زر تسجيل الدخول عبر Facebook
                        socialMediaButtons(
                          image: Image.asset("assets/images/facebook.png"),
                          onTap: () => debugPrint("facebook"),
                        ),
                        // زر تسجيل الدخول عبر Apple
                        socialMediaButtons(
                          image: Image.asset("assets/images/apple.png"),
                          onTap: () => debugPrint("apple"),
                        ),
                      ],
                    ),
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
