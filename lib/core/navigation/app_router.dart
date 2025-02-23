import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/navigation/app_router.gr.dart';
import 'package:simubank/core/presentation/components/error_snack_bar.dart';
import 'package:simubank/features/home/home_route_guard.dart';

export 'app_router.gr.dart';

const _login = '/login';
const _home = '/home';

// Tabs
const _transactions = 'transactions';
const _settings = 'settings';

final routerProvider = Provider<AppRouter>(
  (ref) => AppRouter(ref: ref),
  name: 'App Router',
);

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey, required Ref ref}) : _ref = ref;
  final Ref _ref;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: _login,
          page: LoginRoute.page,
        ),
        AutoRoute(
          initial: true,
          path: _home,
          page: HomeRoute.page,
          guards: [HomeRouteGuard(ref: _ref)],
          children: [
            AutoRoute(
              path: _settings,
              page: SettingsRoute.page,
            ),
            AutoRoute(
              path: _transactions,
              page: TransactionsRoute.page,
            ),
          ],
        ),
      ];
}

extension AppRouterX on AppRouter {
  void showErrorSnackBar({required String title}) {
    final context = navigatorKey.currentContext;
    if (context == null) return;
    final snackBar = ErrorSnackBar(
      context: context,
      title: title,
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
