part of '../meals_config_screen.dart';

class _MealsConfigTopBar extends StatelessWidget {
  const _MealsConfigTopBar();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return SecondarySliverAppBar(
      title: l10n.manageMeals,
      actions: [IconButton(onPressed: () => {}, icon: Icon(addIcon))],
    );
  }
}
