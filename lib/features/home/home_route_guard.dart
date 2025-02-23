import 'package:auto_route/auto_route.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/navigation/app_router.dart';
import 'package:simubank/features/login/data/providers/user_provider.dart';

class HomeRouteGuard extends AutoRouteGuard {
  final Ref ref;

  HomeRouteGuard({
    required this.ref,
  });

  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final user = ref.read(userProvider);
    if (user != null) {
      resolver.next(true);
    } else {
      router.push(LoginRoute());
    }
  }
}
