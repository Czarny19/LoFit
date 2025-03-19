part of '../recipes_details_screen.dart';

class _RecipesDetailsEditStepList extends StatelessWidget {
  const _RecipesDetailsEditStepList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecipesDetailsBloc, RecipesDetailsState>(
      buildWhen: (prev, curr) => prev.recipe?.steps != curr.recipe?.steps,
      builder: (context, state) {
        return SliverPadding(
          padding: EdgeInsets.only(top: (state.recipe?.steps.isEmpty ?? true) ? 0 : paddingMd),
          sliver: SliverList.separated(
            itemCount: state.recipe?.steps.length ?? 0,
            itemBuilder: (context, index) {
              return _RecipesDetailsEditStep(
                index: index,
                isLast: index == state.recipe!.steps.length - 1,
                initialValue: state.recipe!.steps[index] ?? '',
                onValueChange:
                    (value) => context.read<RecipesDetailsBloc>().add(RecipesDetailsStepChanged(index, value)),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(height: paddingSm),
          ),
        );
      },
    );
  }
}
