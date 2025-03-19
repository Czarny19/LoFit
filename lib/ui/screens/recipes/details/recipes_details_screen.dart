import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show FilteringTextInputFormatter;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lofit/data/repositories/recipes_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/router/router.dart';
import 'package:lofit/ui/constants/dimens.dart';
import 'package:lofit/ui/screens/recipes/details/bloc/recipes_details_bloc.dart';
import 'package:lofit/ui/widgets/bar/primary_app_bar.dart';
import 'package:lofit/ui/widgets/button/full_width_button.dart';
import 'package:lofit/ui/widgets/divider/list_divider.dart';
import 'package:lofit/ui/widgets/input/text_input.dart';
import 'package:lofit/ui/widgets/text/header.dart';

part 'widget/recipes_details_edit.dart';

part 'widget/recipes_details_edit_step.dart';

part 'widget/recipes_details_edit_step_list.dart';

part 'widget/recipes_details_section_header.dart';

enum RecipesDetailsScreenNavSource {
  home('home');

  const RecipesDetailsScreenNavSource(this.value);

  final String value;

  factory RecipesDetailsScreenNavSource.fromValue(String? value) {
    return values.firstWhere((e) => e.value == value, orElse: () => RecipesDetailsScreenNavSource.home);
  }
}

class RecipesDetailsScreen extends StatelessWidget {
  const RecipesDetailsScreen({super.key, required this.recipeId, required this.navSource});

  final int recipeId;

  final RecipesDetailsScreenNavSource navSource;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider<RecipesDetailsBloc>(
      create: (context) {
        return RecipesDetailsBloc(recipesRepository: RepositoryProvider.of<RecipesRepository>(context))
          ..add(RecipesDetailsInit(recipeId));
      },
      child: PopScope(
        canPop: false,
        onPopInvokedWithResult: (popped, result) => _popScreen(context, popped),
        child: Scaffold(
          appBar: PrimaryAppBar(
            backIconButtonVisible: true,
            backIconButtonAction: () => _popScreen(context, false),
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.save_outlined, semanticLabel: l10n.recipeSave),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingMd),
            child: recipeId > 0 ? const SizedBox() : const _RecipesDetailsEdit(),
          ),
        ),
      ),
    );
  }

  void _popScreen(BuildContext context, bool popped) {
    // TODO check if touched

    if (!popped) {
      switch (navSource) {
        case RecipesDetailsScreenNavSource.home:
          context.go(pathHomeRecipes);
      }
    }
  }
}
