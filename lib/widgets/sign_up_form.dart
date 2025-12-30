import 'package:flutter/material.dart';
import 'package:project/providers/user_provider.dart';
import 'package:provider/provider.dart';

// الفورم الخاص بإنشاء حساب جديد
class SignUpForm extends StatelessWidget {
  const SignUpForm({
    super.key,
    required GlobalKey<FormState> formKey,
    required TextEditingController nameController,
    required TextEditingController emailController,
    required TextEditingController passwordController,
    required TextEditingController confirmPasswordController,
  })  : _formKey = formKey,
        _nameController = nameController,
        _emailController = emailController,
        _passwordController = passwordController,
        _confirmPasswordController = confirmPasswordController;

  // المفتاح العالمي للتحقق من صحة الفورم
  final GlobalKey<FormState> _formKey;

  // المتحكمات لحفظ بيانات الحقول
  final TextEditingController _nameController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;
  final TextEditingController _confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey, // ربط الفورم بالمفتاح العالمي للتحقق من الصحة
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // عنوان الفورم
          const Text(
            "Create Account",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 20),

          // حقل الاسم الكامل
          const Text("Full Name"),
          const SizedBox(height: 6),
          TextFormField(
            controller: _nameController,
            validator: (value) {
              // التحقق من أن الحقل ليس فارغاً
              if (value == null || value.isEmpty) {
                return "لا يمكن ترك هذا الحقل فارغاً";
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: "Your Name",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          const SizedBox(height: 14),

          // حقل البريد الإلكتروني
          const Text("E-Mail"),
          const SizedBox(height: 6),
          TextFormField(
            controller: _emailController,
            validator: (value) {
              // التحقق من أن البريد ليس فارغاً ويحتوي على @
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
            controller: _passwordController,
            validator: (value) {
              // التحقق من أن كلمة المرور ليست فارغة وطولها مناسب
              if (value == null || value.isEmpty) {
                return "لا يمكن ترك هذا الحقل فارغاً";
              }
              if (value.length < 6) {
                return "يجب أن تكون كلمة المرور أطول من 6";
              }
              return null;
            },
            obscureText: true, // إخفاء النص أثناء الكتابة
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              suffixIcon: Icon(Icons.visibility_off), // أيقونة لإظهار كلمة المرور عند الحاجة
            ),
          ),

          const SizedBox(height: 14),

          // حقل تأكيد كلمة المرور
          const Text("Confirm Password"),
          const SizedBox(height: 6),
          TextFormField(
            controller: _confirmPasswordController,
            validator: (value) {
              // التحقق من أن تأكيد كلمة المرور يطابق كلمة المرور
              if (value == null || value.isEmpty) {
                return "لا يمكن ترك هذا الحقل فارغاً";
              }
              if (value != _passwordController.text) {
                return "يجب أن تتطابق كلمة المرور";
              }
              return null;
            },
            obscureText: true, // إخفاء النص أثناء الكتابة
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // زر تسجيل الحساب
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                overlayColor: Colors.white,
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // التحقق من صحة جميع الحقول قبل الإرسال
                if (_formKey.currentState!.validate()) {
                  if (_nameController.text.isNotEmpty &&
                      _emailController.text.isNotEmpty &&
                      _passwordController.text.isNotEmpty) {
                    final email = _emailController.text;
                    final password = _passwordController.text;

                    // حفظ المستخدم عبر UserProvider
                    context.read<UserProvider>().addUser(email, password);

                    // إظهار رسالة نجاح التسجيل
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Registration successful")),
                    );
                  }
                }
              },
              child: const Text(
                "Sign Up",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),

          // رابط الانتقال لصفحة تسجيل الدخول إذا كان لديه حساب مسبقاً
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "/login_page");
              },
              child: const Text(
                "Already have an account? Sign In",
                style: TextStyle(color: Colors.black54, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
