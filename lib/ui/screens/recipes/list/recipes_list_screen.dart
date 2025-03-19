import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lofit/data/repositories/recipes_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/router/router.dart' show pathHomeRecipeDetails, pathHomeRecipes, pathRecipeDetails;
import 'package:lofit/ui/constants/dimens.dart';
import 'package:lofit/ui/screens/recipes/details/recipes_details_screen.dart';
import 'package:lofit/ui/screens/recipes/list/bloc/recipes_list_bloc.dart';
import 'package:lofit/ui/widgets/button/full_width_button.dart';
import 'package:lofit/ui/widgets/info/info_card.dart';

part 'widget/recipes_list_add_first.dart';

class RecipesListScreen extends StatelessWidget {
  const RecipesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecipesListBloc>(
      create: (context) {
        return RecipesListBloc(recipesRepository: RepositoryProvider.of<RecipesRepository>(context))
          ..add(RecipesListInit());
      },
      child: BlocBuilder<RecipesListBloc, RecipesListState>(
        buildWhen: (prev, curr) => prev.status != curr.status,
        builder: (context, state) {
          return switch (state.status) {
            RecipesListStatus.loading => const SizedBox(),
            RecipesListStatus.empty => const _RecipesListAddFirst(),
            RecipesListStatus.list => const SizedBox(),
          };
        },
      ),
    );
  }
}
