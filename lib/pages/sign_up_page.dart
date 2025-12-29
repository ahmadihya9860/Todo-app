import 'package:flutter/material.dart';
import 'package:project/providers/user_provider.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // المفتاح العالمي للفورم للوصول إلى حالته والتحقق منه
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // المتحكمات لحفظ إدخالات المستخدم في الحقول
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    // التخلص من المتحكمات لتحرير الموارد
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // اللون الرئيسي لخلفية الصفحة
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
        backgroundColor: Colors.transparent,
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
              const SizedBox(height: 20),
              Image.asset("assets/images/Resume.png", width: 240),
              const SizedBox(height: 20),

              Container(
                width: 380,
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(22),
                  child: Form(
                    key: _formKey, // ربط الفورم بالمفتاح العالمي
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Create Account",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 20),

                        const Text("Full Name"),
                        const SizedBox(height: 6),
                        TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            // التحقق من أن الحقل ليس فارغًا
                            if (value == null || value.isEmpty) {
                              return "لا يمكن ترك هذا الحقل فارغاً";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            hintText: "Your Name",
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 14),

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
                          decoration: const InputDecoration(
                            hintText: "example@email.com",
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 14),

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
                          obscureText: true, // إخفاء كلمة المرور
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            suffixIcon: Icon(Icons.visibility_off),
                          ),
                        ),

                        const SizedBox(height: 14),

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
                          obscureText: true,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                          ),
                        ),

                        const SizedBox(height: 24),

                        SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange.shade600,
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

                                  context.read<UserProvider>().addUser(
                                    email,
                                    password,
                                  );

                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("Registration successful"),
                                    ),
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

                        Center(
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "/login_page");
                            },
                            child: const Text(
                              "Already have an account? Sign In",
                              style: TextStyle(
                                color: Colors.black54,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
