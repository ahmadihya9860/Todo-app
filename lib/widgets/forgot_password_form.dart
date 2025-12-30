import 'package:flutter/material.dart';

// صفحة الفورم الخاصة باستعادة كلمة المرور
class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({
    super.key,
    required GlobalKey<FormState> formKey, // المفتاح للتحقق من صحة الفورم
    required this.emailController,        // التحكم بحقل البريد الإلكتروني
  }) : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final TextEditingController emailController;

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  bool _isLoading = false; // حالة التحميل أثناء إرسال الرابط
  bool _isSent = false;    // حالة تم إرسال رابط إعادة التعيين

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget._formKey, // ربط الفورم بالمفتاح العالمي للتحقق من صحة الإدخالات
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // العنوان الرئيسي للفورم
          const Text(
            "Forgot Password",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 8),

          // رسالة توضيحية للمستخدم حسب حالة الإرسال
          Text(
            _isSent
                ? "Check your email for the reset link" // بعد الإرسال
                : "Enter your email to reset your password", // قبل الإرسال
            style: const TextStyle(color: Colors.black54),
          ),

          const SizedBox(height: 20),

          // حقل البريد الإلكتروني يظهر فقط إذا لم يتم الإرسال بعد
          if (!_isSent) ...[
            const Text("E-Mail"),
            const SizedBox(height: 6),
            TextFormField(
              controller: widget.emailController, // ربط الحقل بالمتحكم
              enabled: !_isLoading,               // تعطيل الحقل أثناء التحميل
              keyboardType: TextInputType.emailAddress, // نوع لوحة المفاتيح
              validator: (value) {
                // التحقق من أن الحقل ليس فارغًا ويحتوي على علامة @
                if (value == null || value.isEmpty) {
                  return "لا يمكن ترك هذا الحقل فارغاً";
                }
                if (!value.contains("@")) {
                  return "يرجى إدخال بريد الكتروني صالح";
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "example@email.com",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],

          const SizedBox(height: 24),

          // زر إرسال رابط إعادة التعيين
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
              onPressed: _isLoading
                  ? null // تعطيل الزر أثناء التحميل
                  : () async {
                      // التحقق من صحة الإدخالات
                      if (widget._formKey.currentState!.validate()) {
                        setState(() => _isLoading = true); // بدء حالة التحميل

                        // محاكاة عملية إرسال الرابط لمدة ثانيتين
                        await Future.delayed(
                          const Duration(seconds: 2),
                        );

                        // بعد انتهاء التحميل، تحديث الحالة لإظهار رسالة النجاح
                        setState(() {
                          _isLoading = false;
                          _isSent = true;
                        });
                      }
                    },
              child: _isLoading
                  ? const SizedBox(
                      width: 22,
                      height: 22,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      _isSent ? "Resend Link" : "Send Reset Link",
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
            ),
          ),

          const SizedBox(height: 16),

          // رابط العودة إلى صفحة تسجيل الدخول
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pop(context); // الرجوع للصفحة السابقة
              },
              child: const Text(
                "Back to Sign In",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
