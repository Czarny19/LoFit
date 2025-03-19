import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart' show GoRouter, GoRouterHelper, StatefulNavigationShell;
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/router/router.dart';
import 'package:lofit/ui/constants/icons.dart';
import 'package:lofit/ui/widgets/bar/primary_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  void _goBranch(int index) {
    navigationShell.goBranch(index, initialLocation: index == navigationShell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    final currentLocation = GoRouter.of(context).state.fullPath;
    final bottomNavVisible = [pathHomeMore, pathHomeMeals, pathHomeShopping, pathHomeRecipes].contains(currentLocation);
    final appBarVisible = ![pathRecipeDetailsFull].contains(currentLocation);

    return Scaffold(
      appBar: PrimaryAppBar(
        visible: appBarVisible,
        backIconButtonVisible: !bottomNavVisible,
        backIconButtonAction: () => context.pop(),
      ),
      body: navigationShell,
      bottomNavigationBar:
          bottomNavVisible
              ? NavigationBar(
                selectedIndex: navigationShell.currentIndex,
                destinations: [
                  NavigationDestination(label: l10n.homeTabMeals, icon: const Icon(homeTabMealsIcon)),
                  NavigationDestination(label: l10n.homeTabRecipes, icon: const Icon(homeTabRecipesIcon)),
                  NavigationDestination(label: l10n.homeTabShoppingList, icon: const Icon(homeTabShoppingIcon)),
                  NavigationDestination(label: l10n.homeTabMore, icon: const Icon(homeTabMoreIcon)),
                ],
                onDestinationSelected: _goBranch,
              )
              : null,
    );
  }
}
