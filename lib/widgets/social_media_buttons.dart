import 'package:flutter/material.dart';

// دالة لإنشاء زر وسائط اجتماعية قابل للنقر
Widget socialMediaButtons({required Image image, void Function()? onTap}) {
  return InkWell(
    // منح الزر حدود دائرية لتأثير الضغط
    borderRadius: BorderRadius.circular(50),
    // لون التأثير عند الضغط على الزر
    splashColor: Colors.white.withValues(alpha: .3),
    // الدالة التي تنفذ عند النقر
    onTap: onTap,
    child: Ink(
      // تحديد حجم الزر
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        // يمكن إضافة لون خلفية أو شكل دائري إذا رغبت
        // color: Colors.white.withValues(alpha: .5),
        // shape: BoxShape.circle,
      ),
      // وضع الصورة داخل الزر مع Padding لإضافة مسافة حولها
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: image,
      ),
    ),
  );
}
