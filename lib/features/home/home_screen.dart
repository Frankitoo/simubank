import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simubank/core/navigation/app_router.gr.dart';
import 'package:simubank/core/presentation/theme/app_colors.dart';

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AutoTabsRouter(
      routes: [
        TransactionsRoute(),
        SettingsRoute(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 560),
              child: child,
            ),
          ),
          bottomNavigationBar: Theme(
            data: ThemeData(splashColor: Colors.transparent),
            child: BottomNavigationBar(
              showSelectedLabels: false,
              showUnselectedLabels: false,
              enableFeedback: false,
              backgroundColor: colorScheme.surface,
              selectedItemColor: colorScheme.primary,
              unselectedItemColor: AppColors.unselectedTab,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.sync_alt),
                ),
                BottomNavigationBarItem(
                  label: '',
                  icon: Icon(Icons.tune),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
