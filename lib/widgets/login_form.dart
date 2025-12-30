import 'package:flutter/material.dart';
import 'package:project/pages/forgot_password_page.dart';
import 'package:project/widgets/forgot_password_form.dart';
import 'package:project/providers/user_provider.dart';
import 'package:provider/provider.dart';

// الفورم الخاص بتسجيل الدخول
class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.emailController,
    required this.passwordController,
  }) : _formKey = formKey;

  // المفتاح العالمي للتحقق من صحة الفورم
  final GlobalKey<FormState> _formKey;

  // المتحكمات لحفظ القيم المدخلة من المستخدم
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // إنشاء AnimationController للتحكم في الرسوم المتحركة عند الانتقال بين الصفحات
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey, // ربط الفورم بالمفتاح العالمي
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Login",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 20),

          // حقل البريد الإلكتروني
          const Text("E-Mail"),
          const SizedBox(height: 6),
          TextFormField(
            controller: widget.emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "لا يمكن ترك هذا الحقل فارغاً";
              }
              if (!value.contains("@")) {
                return "يرجى إدخال بريد الكتروني صالح";
              }
              return null;
            },
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              hintText: "example@email.com",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // حقل كلمة المرور
          const Text("Password"),
          const SizedBox(height: 6),
          TextFormField(
            controller: widget.passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "لا يمكن ترك هذا الحقل فارغاً";
              }
              return null;
            },
            obscureText: true, // إخفاء النص المدخل
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: Icon(Icons.visibility_off), // أيقونة لإظهار/إخفاء كلمة المرور
            ),
          ),

          const SizedBox(height: 12),

          // روابط إضافية: إنشاء حساب أو نسيت كلمة المرور
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // زر إنشاء حساب جديد
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/sign_up_page");
                },
                child: const Text(
                  "Create account",
                  style: TextStyle(color: Colors.black54),
                ),
              ),

              // زر نسيت كلمة المرور
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) {
                        return SlideTransition(
                          position: Tween<Offset>(
                            begin: Offset(0, 1), // يبدأ من أسفل الشاشة
                            end: Offset(0, 0),   // ينتهي في مكانه الطبيعي
                          ).animate(animation),
                          child: ForgotPasswordPage(), // صفحة استعادة كلمة المرور
                        );
                      },
                    ),
                  );
                },
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // زر تسجيل الدخول
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // التحقق من صحة الفورم
                if (widget._formKey.currentState!.validate()) {
                  final email = widget.emailController.text;
                  final password = widget.passwordController.text;

                  // جلب بيانات المستخدم من UserProvider
                  final userData = context.read<UserProvider>().getUser();

                  if (userData != null) {
                    // التحقق من صحة البريد الإلكتروني وكلمة المرور
                    if (userData.email == email &&
                        userData.password == password) {
                      Navigator.pushNamed(context, "/home_page"); // الانتقال للصفحة الرئيسية
                    } else {
                      // عرض رسالة خطأ إذا كانت البيانات غير صحيحة
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Incorrect email or password"),
                        ),
                      );
                    }
                  } else {
                    // عرض رسالة إذا لم يقم المستخدم بإنشاء حساب بعد
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please create an account first"),
                      ),
                    );
                  }
                }
              },
              child: const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
