import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/providers/user_provider.dart';
import 'package:project/widgets/sign_up_form.dart';
import 'package:project/widgets/social_media_buttons.dart';
import 'package:provider/provider.dart';

// صفحة تسجيل حساب جديد
class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // المفتاح العالمي للفورم للتحقق من صحة الحقول
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // المتحكمات لحفظ القيم المدخلة من المستخدم
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // تحرير المتحكمات عند التخلص من الصفحة
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // خلفية الصفحة بتدرج لوني
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
        backgroundColor: Colors.transparent, // للسماح برؤية الخلفية
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent, // شفاف لإظهار الخلفية
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
        body: SingleChildScrollView(
          // يسمح بالتمرير عند ظهور لوحة المفاتيح
          child: Column(
            children: [
              const SizedBox(height: 8),

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
                      color: Colors.white.withOpacity(0.4), // ظل داخلي
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: SignUpForm(
                    formKey: _formKey,
                    nameController: _nameController,
                    emailController: _emailController,
                    passwordController: _passwordController,
                    confirmPasswordController: _confirmPasswordController,
                  ),
                ),
              ),

              const SizedBox(height: 8),

              // فاصل OR بين الفورم وطرق تسجيل الدخول الاجتماعي
              Row(
                children: [
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(color: Colors.white),
                    ),
                  ),
                  Text(
                    "OR",
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(color: Colors.white),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // قسم تسجيل الدخول باستخدام الشبكات الاجتماعية مع تأثير Glassmorphism
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // ضبابية الخلفية
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Container(
                      height: 80,
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
      ),
    );
  }
}
