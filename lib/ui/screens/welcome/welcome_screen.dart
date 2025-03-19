import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lofit/data/repositories/global_repository.dart';
import 'package:lofit/data/repositories/meals_repository.dart';
import 'package:lofit/data/repositories/recipes_repository.dart';
import 'package:lofit/data/repositories/tags_repository.dart';
import 'package:lofit/l10n/gen/app_localizations.dart';
import 'package:lofit/router/router.dart';
import 'package:lofit/ui/constants/dimens.dart';
import 'package:lofit/ui/constants/icons.dart';
import 'package:lofit/ui/screens/welcome/bloc/welcome_bloc.dart';
import 'package:lofit/ui/widgets/button/full_width_button.dart';
import 'package:lofit/ui/widgets/info/info_card.dart';
import 'package:lofit/ui/widgets/input/text_input.dart';
import 'package:lofit/ui/widgets/intake/daily_intake.dart';
import 'package:lofit/ui/widgets/loading/app_loading.dart';
import 'package:lofit/ui/widgets/text/headline_large.dart';

part 'widget/welcome_form.dart';

part 'widget/welcome_start.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return BlocProvider<WelcomeBloc>(
      create: (context) {
        return WelcomeBloc(
          globalRepository: RepositoryProvider.of<GlobalRepository>(context),
          mealsRepository: RepositoryProvider.of<MealsRepository>(context),
          recipeRepository: RepositoryProvider.of<RecipesRepository>(context),
          tagsRepository: RepositoryProvider.of<TagsRepository>(context),
        )..add(WelcomeInit());
      },
      child: BlocConsumer<WelcomeBloc, WelcomeState>(
        buildWhen: (prev, curr) => prev.status != curr.status,
        listener: (context, state) {
          if (state.status == WelcomeStatus.skip || state.status == WelcomeStatus.finished) {
            context.replace(pathHomeMeals);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: state.status == WelcomeStatus.form ? AppBar(title: Text(l10n.appName), centerTitle: true) : null,
            body: switch (state.status) {
              WelcomeStatus.loading => const AppLoading(),
              WelcomeStatus.start => const _WelcomeStart(),
              WelcomeStatus.form => _WelcomeForm(),
              WelcomeStatus.saving => AppLoading(label: l10n.saving),
              WelcomeStatus.skip || WelcomeStatus.finished => const SizedBox(),
            },
          );
        },
      ),
    );
  }
}
