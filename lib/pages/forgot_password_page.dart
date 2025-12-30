import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:project/widgets/forgot_password_form.dart';

// صفحة Forgot Password الكاملة
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // مفتاح الفورم للتحقق من صحة الإدخالات
  final TextEditingController emailController = TextEditingController(); // المتحكم بحقل البريد الإلكتروني

  @override
  void dispose() {
    emailController.dispose(); // تحرير الموارد عند التخلص من الصفحة
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // خلفية متدرجة للصفحة
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.orange.shade700, Colors.orange.shade300],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          transform: GradientRotation(8),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent, // السماح برؤية الخلفية
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white), // لون أيقونات العودة
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(vertical: 16), // مساحة رأسية حول المحتوى
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header باستخدام Glassmorphism
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16), // تأثير الضبابية
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.2), // خلفية شبه شفافة
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            // عنوان رئيسي
                            Text(
                              "Forgot Password",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            // نص توضيحي
                            Text(
                              "Enter your email to reset your password",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 16,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // حاوية الفورم
              Container(
                width: MediaQuery.of(context).size.width * 0.9, // عرض responsive
                padding: const EdgeInsets.all(22.0), // مسافة داخلية
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.75), // خلفية شبه شفافة للفورم
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 20,
                      color: Colors.white.withOpacity(0.4), // تأثير الظل الداخلي
                      blurStyle: BlurStyle.inner,
                    ),
                  ],
                ),
                child: ForgotPasswordForm(
                  formKey: _formKey,           // تمرير مفتاح الفورم
                  emailController: emailController, // تمرير المتحكم بحقل البريد
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
