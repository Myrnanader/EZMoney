import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

enum SnackBarType { error, success, info }

class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.error,
  }) {
    if (!context.mounted) return;

    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        duration: const Duration(seconds: 3),
        content: _AppSnackBarContent(message: message, type: type),
      ),
    );
  }
}

class _AppSnackBarContent extends StatefulWidget {
  final String message;
  final SnackBarType type;

  const _AppSnackBarContent({
    required this.message,
    required this.type,
  });

  @override
  State<_AppSnackBarContent> createState() => _AppSnackBarContentState();
}

class _AppSnackBarContentState extends State<_AppSnackBarContent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );

    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.3),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _SnackConfig get _config {
    switch (widget.type) {
      case SnackBarType.error:
        return _SnackConfig(
          // خلفية بيضاء زي الكارد بتاع التطبيق
          bgColor: const Color(0xFFFFFFFF),
          leftBarColor: const Color(0xFFE74C3C),
          iconBg: const Color(0xFFE74C3C).withOpacity(0.08),
          iconColor: const Color(0xFFE74C3C),
          icon: Icons.error_rounded,
          textColor: const Color(0xFF0D1B2A),
          subColor: const Color(0xFF6B7280),
        );
      case SnackBarType.success:
        return _SnackConfig(
          bgColor: const Color(0xFFFFFFFF),
          leftBarColor: const Color(0xFF2ECC71),
          iconBg: const Color(0xFF2ECC71).withOpacity(0.08),
          iconColor: const Color(0xFF2ECC71),
          icon: Icons.check_circle_rounded,
          textColor: const Color(0xFF0D1B2A),
          subColor: const Color(0xFF6B7280),
        );
      case SnackBarType.info:
        return _SnackConfig(
          bgColor: const Color(0xFFFFFFFF),
          leftBarColor: const Color(0xFF0b386f),
          iconBg: const Color(0xFF0b386f).withOpacity(0.08),
          iconColor: const Color(0xFF0b386f),
          icon: Icons.info_rounded,
          textColor: const Color(0xFF0D1B2A),
          subColor: const Color(0xFF6B7280),
        );
    }
  }

  String get _label {
    switch (widget.type) {
      case SnackBarType.error:
        return "Error";
      case SnackBarType.success:
        return "Success";
      case SnackBarType.info:
        return "Info";
    }
  }

  @override
  Widget build(BuildContext context) {
    final c = _config;

    return FadeTransition(
      opacity: _fadeAnim,
      child: SlideTransition(
        position: _slideAnim,
        child: Container(
          decoration: BoxDecoration(
            color: c.bgColor,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF0b386f).withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 6),
              ),
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  //  الشريط الجانبي - علامة مميزة للتطبيق
                  Container(
                    width: 4.w,
                    color: c.leftBarColor,
                  ),

                  //  المحتوى
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14.w,
                        vertical: 14.h,
                      ),
                      child: Row(
                        children: [
                          // Icon
                          Container(
                            width: 38.w,
                            height: 38.w,
                            decoration: BoxDecoration(
                              color: c.iconBg,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Icon(
                              c.icon,
                              color: c.iconColor,
                              size: 20.sp,
                            ),
                          ),

                          SizedBox(width: 12.w),

                          // Text
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  _label,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w700,
                                    color: c.leftBarColor,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                                SizedBox(height: 2.h),
                                Text(
                                  widget.message,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.w500,
                                    color: c.textColor,
                                    height: 1.4,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _SnackConfig {
  final Color bgColor;
  final Color leftBarColor;
  final Color iconBg;
  final Color iconColor;
  final IconData icon;
  final Color textColor;
  final Color subColor;

  _SnackConfig({
    required this.bgColor,
    required this.leftBarColor,
    required this.iconBg,
    required this.iconColor,
    required this.icon,
    required this.textColor,
    required this.subColor,
  });
}