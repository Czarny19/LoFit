part of '../recipes_details_screen.dart';

class _RecipesDetailsEdit extends StatelessWidget {
  const _RecipesDetailsEdit();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = AppLocalizations.of(context)!;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: paddingMd),
          sliver: SliverToBoxAdapter(
            child: TextInput(label: l10n.recipeName, initialValue: '', onValueChange: (value) => {}),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(vertical: paddingMd),
          sliver: SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: Text('${l10n.recipeTimeToMake}:', style: theme.textTheme.labelLarge)),
                SizedBox(
                  width: 120,
                  child: BlocBuilder<RecipesDetailsBloc, RecipesDetailsState>(
                    builder: (context, state) {
                      return TextInput(
                        label: null,
                        initialValue: state.recipe?.timeToMake.toString() ?? '',
                        inputType: TextInputType.number,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        suffixText: l10n.recipeTimeToMakeMins,
                        onValueChange:
                            (value) => context.read<RecipesDetailsBloc>().add(
                              RecipesDetailsTimeToMakeChanged(value.isEmpty ? 0 : int.parse(value)),
                            ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPersistentHeader(delegate: _RecipesDetailsSectionHeader(label: 'Ingredients')),
        SliverList.separated(
          itemCount: 0,
          itemBuilder: (context, index) => SizedBox(),
          separatorBuilder: (context, index) => const ListDivider(),
        ),
        SliverToBoxAdapter(
          child: FullWidthButton(
            label: '+ Add ingredient',
            onClick: () => context.read<RecipesDetailsBloc>().add(RecipesDetailsStepAdded()),
          ),
        ),
        SliverMainAxisGroup(
          slivers: [
            SliverPersistentHeader(delegate: _RecipesDetailsSectionHeader(label: l10n.recipeSteps), pinned: true),
            const _RecipesDetailsEditStepList(),
            SliverPadding(
              padding: EdgeInsets.symmetric(vertical: paddingMd),
              sliver: SliverToBoxAdapter(
                child: FullWidthButton(
                  label: l10n.recipeStepAdd,
                  onClick: () => context.read<RecipesDetailsBloc>().add(RecipesDetailsStepAdded()),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
