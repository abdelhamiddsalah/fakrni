import 'package:fakrni/config/routing/app_routes.dart';
import 'package:fakrni/features/authintication/presentation/screens/signup_child_view.dart';
import 'package:fakrni/features/authintication/presentation/screens/signup_parent_view.dart';
import 'package:fakrni/features/authintication/presentation/screens/usertype_view.dart';
import 'package:fakrni/features/authintication/presentation/screens/verifyphone_view.dart';
import 'package:fakrni/features/home/data/models/challenge_model.dart';
import 'package:fakrni/features/home/presentation/screens/chiled_home_details_view.dart';
import 'package:fakrni/features/home/presentation/screens/home_child_view.dart';
import 'package:fakrni/features/home/presentation/screens/home_parent_view.dart';
import 'package:fakrni/features/onboarding/presentation/screens/onboarding_view.dart';
import 'package:go_router/go_router.dart';

class AppRouting {
   static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.onboarding,
      routes: [
         GoRoute(path: AppRoutes.onboarding,builder: (context, state) => const OnboardingView(),),
         GoRoute(path: AppRoutes.usertype, builder: (context, state) => const UsertypeView()),
         GoRoute(path: AppRoutes.signupparent, builder: (context, state) => const SignupParentView()),
         GoRoute(path: AppRoutes.signupchild, builder: (context, state) => const SignupChildView()),
         GoRoute(path: AppRoutes.verifyPhone, builder: (context, state) => const VerifyphoneView()),
         GoRoute(path: AppRoutes.parenthome, builder: (context, state) => const HomeParentView()),
         GoRoute(path: AppRoutes.childhome, builder: (context, state) => const HomeChildView()),
         GoRoute(path: AppRoutes.childhomedetails, builder: (context, state) => ChiledHomeDetailsView(
           challengeModel:  state.extra as ChallengeModel, // Assuming you pass the challenge model as an extra
         )),
      ],
   );
}