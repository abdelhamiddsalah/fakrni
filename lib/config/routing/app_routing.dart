import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/features/authintication/presentation/screens/usertype_view.dart';
import 'package:fakrni/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
   static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
      routes: [
         GoRoute(
            path: AppRoutes.onboarding,
            builder: (context, state) => const OnboardingView(),
         ),
         GoRoute(path: AppRoutes.usertype, builder: (context, state) => const UsertypeView()),
      ],
   );
}