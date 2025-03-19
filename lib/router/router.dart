import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lofit/ui/screens/home/home_screen.dart';
import 'package:lofit/ui/screens/meals/list/meals_list_screen.dart';
import 'package:lofit/ui/screens/more/config/intake/intake_config_screen.dart';
import 'package:lofit/ui/screens/more/config/meals/meals_config_screen.dart';
import 'package:lofit/ui/screens/more/list/more_list_screen.dart';
import 'package:lofit/ui/screens/recipes/details/recipes_details_screen.dart';
import 'package:lofit/ui/screens/recipes/list/recipes_list_screen.dart';
import 'package:lofit/ui/screens/shopping/list/shopping_list_screen.dart';
import 'package:lofit/ui/screens/welcome/welcome_screen.dart';

const pathWelcome = '/welcome';

const pathHomeMeals = '/meals';
const pathHomeRecipes = '/recipes';
const pathHomeShopping = '/shopping';
const pathHomeMore = '/more';

const pathHomeMoreIntake = '/more/intake';
const pathHomeMoreMeals = '/more/meals';

const pathRecipeDetails = '/recipe/';
const pathRecipeDetailsFull = '/recipe/:recipeId&:navSource';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorMealsKey = GlobalKey<NavigatorState>();
final _shellNavigatorRecipesKey = GlobalKey<NavigatorState>();
final _shellNavigatorShoppingKey = GlobalKey<NavigatorState>();
final _shellNavigatorMoreKey = GlobalKey<NavigatorState>();

final goRouter = GoRouter(
  initialLocation: pathWelcome,
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(path: pathWelcome, builder: (context, state) => const WelcomeScreen()),
    GoRoute(
      path: pathRecipeDetailsFull,
      pageBuilder: (context, state) {
        final navSource = state.pathParameters['navSource'];
        final recipeId = state.pathParameters['recipeId'];

        return NoTransitionPage(
          child: RecipesDetailsScreen(
            recipeId: recipeId != null ? int.parse(recipeId) : -1,
            navSource: RecipesDetailsScreenNavSource.fromValue(navSource),
          ),
        );
      },
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => HomeScreen(navigationShell: navigationShell),
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMealsKey,
          routes: [
            GoRoute(
              path: pathHomeMeals,
              pageBuilder: (context, state) => const NoTransitionPage(child: MealsListScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRecipesKey,
          routes: [
            GoRoute(
              path: pathHomeRecipes,
              pageBuilder: (context, state) => const NoTransitionPage(child: RecipesListScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorShoppingKey,
          routes: [
            GoRoute(
              path: pathHomeShopping,
              pageBuilder: (context, state) => const NoTransitionPage(child: ShoppingListScreen()),
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorMoreKey,
          routes: [
            GoRoute(
              path: pathHomeMore,
              pageBuilder: (context, state) => NoTransitionPage(key: UniqueKey(), child: MoreListScreen()),
              routes: [
                GoRoute(
                  path: 'intake',
                  pageBuilder: (context, state) => const NoTransitionPage(child: IntakeConfigScreen()),
                ),
                GoRoute(
                  path: 'meals',
                  pageBuilder: (context, state) => const NoTransitionPage(child: MealsConfigScreen()),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);
