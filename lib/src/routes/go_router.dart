import 'package:flutter/material.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/auth/login_page.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/auth/signup_page.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/dashboard/pages/dash_board.dart';
import 'package:flutter_application_radisha_admin_pannel/src/features/user_management/pages/add_new_user.dart';
import 'package:go_router/go_router.dart';

import 'error_route.dart';
import 'route_transition.dart';

class MyAppRouter {
  static final router = GoRouter(
    initialLocation: '/${AppRoute.loginPage}',
    routes: [
      GoRoute(
        name: AppRoute.loginPage,
        path: '/${AppRoute.loginPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const LoginPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.signUpPage,
        path: '/${AppRoute.signUpPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const SignupPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.dashboardPage,
        path: '/${AppRoute.dashboardPage}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const DashboardPage(),
        ),
      ),
      GoRoute(
        name: AppRoute.addNewUser,
        path: '/${AppRoute.addNewUser}',
        pageBuilder: (context, state) => buildPageWithFadeTransition<void>(
          context: context,
          state: state,
          child: const AddNewUser(),
        ),
      ),
    ],
    errorPageBuilder: (context, state) {
      return MaterialPage(child: ErrorPage());
    },
  );

  static void clearAndNavigate(BuildContext context, String name) {
    while (context.canPop()) {
      context.pop();
    }
    context.pushReplacementNamed(name);
  }
}

class AppRoute {
  static const String errorPage = 'error-page';

  /// auth
  static const loginPage = 'login-page';
  static const signUpPage = 'sign-in';
  // dashboard
  static const dashboardPage = 'dash-board-page';

  /// User Managemnet
  static const addNewUser = 'add-new-user';
}
