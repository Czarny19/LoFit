part of '../recipes_list_screen.dart';

class _RecipesListAddFirst extends StatelessWidget {
  const _RecipesListAddFirst();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(padding: EdgeInsets.all(paddingMd), child: InfoCard(msg: l10n.addFirstRecipeInfo)),
          FullWidthButton(
            label: l10n.addFirstRecipe,
            onClick: () => context.go('$pathRecipeDetails-1&${RecipesDetailsScreenNavSource.home.value}'),
          ),
        ],
      ),
    );
  }
}
