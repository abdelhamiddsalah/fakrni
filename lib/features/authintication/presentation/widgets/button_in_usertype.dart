import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/core/enums/enums.dart';
import 'package:fakrni/core/widgets/button_for_nav.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonInUserType extends StatelessWidget {
  const ButtonInUserType({
    super.key,
    required this.selectedType,
  });

  final UserType? selectedType;

  Future<void> _handleNavigation(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final isParentRegistered = prefs.getBool('isParentRegistered') ?? false;

    if (selectedType == UserType.parent && isParentRegistered) {
      // يروح مباشرة إلى الصفحة الرئيسية لولي الأمر
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(AppRoutes.parenthome);
    } else {
      // يروح لصفحة التسجيل حسب النوع المختار
      // ignore: use_build_context_synchronously
      GoRouter.of(context).push(
        selectedType == UserType.parent
            ? AppRoutes.signupparent
            : AppRoutes.signupchild,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: selectedType != null ? 1 : 0.5,
      child: IgnorePointer(
        ignoring: selectedType == null,
        child: ButtonForNav(
          onTap: () => _handleNavigation(context),
        ),
      ),
    );
  }
}
